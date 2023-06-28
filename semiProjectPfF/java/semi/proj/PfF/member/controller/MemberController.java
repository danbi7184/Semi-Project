package semi.proj.PfF.member.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import semi.proj.PfF.common.model.service.MailSendService;
import semi.proj.PfF.member.model.exception.MemberException;
import semi.proj.PfF.member.model.service.MemberService;
import semi.proj.PfF.member.model.vo.KakaoMember;
import semi.proj.PfF.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 로그인 화면 이동
		@GetMapping("loginView.me")
		public String loginView() {
			return "login";
		}

		// 회원로그인
		@PostMapping("login.me")
		public String login(@ModelAttribute Member login, Model model) {
			Member m = mService.login(login);
			
			if(m != null && bcrypt.matches(login.getMemberPwd(), m.getMemberPwd())) {
				model.addAttribute("loginUser", m);
				return "redirect:/";
			} else throw new MemberException("아이디 혹은 비밀번호를 확인하세요.");
		}
		
		// 로그아웃
		@GetMapping("logout.me")
		public String logout(SessionStatus status) {
			status.setComplete();
			return "redirect:/";
		}

		// 회원가입 약관동의로 이동
		@GetMapping("enrollViewAgree.me")
		public String enrollViewAgree() {
			return "enrollViewAgree";
		}

		// 약관동의에서 회원가입으로 이동
		@RequestMapping("enrollView.me")
		public String enrollView(@RequestParam(name = "eventAgree", required = false, defaultValue = "N") String eventAgree, HttpServletRequest request) {
			request.setAttribute("eventAgree", eventAgree);
			return "enrollView";
		}

		// 회원가입 집전화가 둘중에 하나라도 널이면 오류발생
		@PostMapping("enroll.me")
		public String enroll(@ModelAttribute Member enrollUser, @RequestParam("homePhone1") String home1, @RequestParam("homePhone2") String home2, @RequestParam("homePhone3") String home3,
				 			@RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2, @RequestParam("phone3") String phone3,
				 			@RequestParam("postCode") String addr1, @RequestParam("address") String addr2, @RequestParam("detailAddress") String addr3, @RequestParam("refAddress") String addr4,
				 			Model model) {
			
			if(home2 != null && home3 != null) {
				enrollUser.setMemberHomePhone(home1 + "-" + home2.trim() + "-" + home3.trim());
			} else if((home2 == null && home3 != null) || (home2 != null && home3 == null)) {
				throw new MemberException("회원가입에 실패하였습니다.");
			} else {
				enrollUser.setMemberHomePhone(null);
			}
			
			enrollUser.setMemberPhone(phone1 + "-" + phone2.trim() + "-" + phone3.trim());
			enrollUser.setMemberAddress(addr1 + "/" + addr2 + "/" + addr3 + "/" + addr4);
			
			enrollUser.setMemberPwd(bcrypt.encode(enrollUser.getMemberPwd()));
			
			int result = mService.enroll(enrollUser);
			
			if(result > 0) {
				model.addAttribute("loginUser", mService.login(enrollUser));
				return "redirect:/";
			} else throw new MemberException("회원가입에 실패하였습니다.");
			
		}
		
		// 아이디 중복 체크
		@RequestMapping("checkId.me")
		public void checkId(@RequestParam("id") String id, PrintWriter out) {
			int count = mService.checkId(id);
			out.print(count == 0 ? "yes" : "no");
		}
		
		// 닉네임 중복 체크
		@RequestMapping("checkNickName.me")
		public void checkNickName(@RequestParam("nickname") String nickname, PrintWriter out) {
			out.print(mService.checkNickName(nickname) == 0 ? "yes" : "no");
		}
		
		// 이메일 중복 체크
		@RequestMapping("checkEmail.me")
		public void checkEmail(@RequestParam("email") String email, PrintWriter out) {
			int count = mService.checkEmail(email);
			out.print(count == 0 ? "yes" : "no");
		}
		
		// 카카오로그인
		@PostMapping("kakaoLogin.me")
		public String kakaoLogin(@ModelAttribute KakaoMember loginUser, Model model) {
			// DB에 정보가 있다면 로그인, 없다면 회원가입 후 로그인
			KakaoMember kakao = mService.selectKakaoMember(loginUser);
			
			if(kakao != null) {
				model.addAttribute("loginUser", kakao);
				return "redirect:/";
			} else {
				int result = mService.enrollKakao(loginUser);
				
				KakaoMember enrollKakao = mService.selectKakaoMember(loginUser);
				
				model.addAttribute("loginUser", enrollKakao);
				return "redirect:/";
			}
			
		}
		
		// 인증 메일 확인
				@RequestMapping("mailCheck.me")
				@ResponseBody
				public String mailCheck(String email) {
					return mailService.joinEmail(email);
				}
			
				@RequestMapping(value = "changeEmailCheck.me", method = RequestMethod.GET )	
				@ResponseBody
				public String changeEmailCheck(String email) throws Exception{ //반환값이 있기에 메서드 타입도 String
					System.out.println("이메일 데이터 전송 확인");  //확인용
					System.out.println("인증 이메일 : " + email);  
					
					
					//인증번호 생성
					Random random = new Random();
					int checkNum = random.nextInt(888888) + 111111;
					System.out.println("인증번호 :"+ checkNum);
					
					
					//이메일 전송 내용
					String setFrom = "xodnr15860@gmail.com"; //발신 이메일
					String toMail = email;         //받는 이메일
					String title = "PfF 이메일변경 인증 이메일 입니다.";
					String content = "인증 번호는 " + checkNum + "입니다." + 
									 "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
					//이메일 전송 코드
					try {
						MimeMessage message = mailSender.createMimeMessage();
						MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
						helper.setFrom(setFrom);
						helper.setTo(toMail);
						helper.setSubject(title);
						helper.setText(content,true);
						mailSender.send(message);
					} catch(Exception e) {
						e.printStackTrace();
					}
					String num = Integer.toString(checkNum); // ajax를 뷰로 반환시 데이터 타입은 String 타입만 가능
					return num; // String 타입으로 변환 후 반환
				}	
				
				@RequestMapping(value = "findIdCheck.me", method = RequestMethod.GET )	
				@ResponseBody
				public String searchIdCheck(String email) throws Exception{ //반환값이 있기에 메서드 타입도 String
					// System.out.println("이메일 데이터 전송 확인");  //확인용
					// System.out.println("인증 이메일 : " + email);  
					
					//인증번호 생성
					Random random = new Random();
					int checkNum = random.nextInt(888888) + 111111;
					// System.out.println("인증번호 :"+ checkNum);
					
					//이메일 전송 내용
					String setFrom = "xodnr15860@gmail.com"; //발신 이메일
					String toMail = email;        			 //받는 이메일
					String title = "PfF 아이디찾기 인증 이메일 입니다.";
					String content = "인증 번호는 " + checkNum + "입니다." + 
									 "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
					//이메일 전송 코드
					try {
						MimeMessage message = mailSender.createMimeMessage();
						MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
						helper.setFrom(setFrom);
						helper.setTo(toMail);
						helper.setSubject(title);
						helper.setText(content,true);
						mailSender.send(message);
					} catch(Exception e) {
						e.printStackTrace();
					}
					String num = Integer.toString(checkNum); // ajax를 뷰로 반환시 데이터 타입은 String 타입만 가능
					return num; // String 타입으로 변환 후 반환
				}
				
				@RequestMapping(value = "findPwdCheck.me", method = RequestMethod.GET )	
				@ResponseBody
				public String searchPwdCheck(String email) throws Exception{ //반환값이 있기에 메서드 타입도 String
					// System.out.println("이메일 데이터 전송 확인");  //확인용
					// System.out.println("인증 이메일 : " + email);  
					
					//인증번호 생성
					Random random = new Random();
					int checkNum = random.nextInt(888888) + 111111;
					// System.out.println("인증번호 :"+ checkNum);
					
					//이메일 전송 내용
					String setFrom = "xodnr15860@gmail.com"; //발신 이메일
					String toMail = email;        			 //받는 이메일
					String title = "PfF 비밀번호찾기 인증 이메일 입니다.";
					String content = "인증 번호는 " + checkNum + "입니다." + 
									 "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
					//이메일 전송 코드
					try {
						MimeMessage message = mailSender.createMimeMessage();
						MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
						helper.setFrom(setFrom);
						helper.setTo(toMail);
						helper.setSubject(title);
						helper.setText(content,true);
						mailSender.send(message);
					} catch(Exception e) {
						e.printStackTrace();
					}
					String num = Integer.toString(checkNum); // ajax를 뷰로 반환시 데이터 타입은 String 타입만 가능
					return num; // String 타입으로 변환 후 반환
				}
				
				
				@RequestMapping("findId.me")
				public String findId() {
					
					return "findId";
				}
				
				@RequestMapping("findPwd.me")
				public String findPwd() {
					
					return "findPwd";
				}
				
				@PostMapping("findIdResult.me")
				 public String findIdResult(@RequestParam(value = "email", required = true) String email, Model model) {
					String id = mService.findIdResult(email);
			        
			        if (id != null) {
			            model.addAttribute("existId", true);
			            model.addAttribute("id", id);
			        } else {
			            model.addAttribute("existId", false);
			        }
			        return "findIdResult";
			     }
				
				@PostMapping("findPwdResult.me")
				 public String findPwdResult(@ModelAttribute Member m, Model model) {
					
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("memberId", m.getMemberId());
					map.put("memberEmail", m.getMemberEmail());
					
					int result = mService.findPwdResult(map);
					
					if(result > 0) {
						model.addAttribute("memberId", m.getMemberId());
						return "findPwdResult";
					} else {
						throw new MemberException("일치하는 정보가 없습니다.");
					}
			    }
				
				@PostMapping("updatePw.me")
				public String updatePw(@RequestParam("newPwd") String pwd, @RequestParam("memberId") String id, Model model) {
					
					Member m = (Member)model.getAttribute("loginUser");
					
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("memberId", id);
					map.put("newPwd", bcrypt.encode(pwd));
					
					int result = mService.updatePw(map);
					
					if(result > 0) {
						model.addAttribute("loginuser", mService.login(m)); 
						return "redirect:/";
					} else {
						throw new MemberException("비밀번호 수정이 실패하였습니다.");
					}
				}
				
				@GetMapping("checkNickname.me")
				@ResponseBody
				// 응답을 할 때 body부분에 담아서 반납하겠다. 그 값 자체를 사용한다는 의미
				public String checkNickname(@RequestParam("nickName") String nickName) {
					int count = mService.checkNickname(nickName);
					
					String result = count == 0 ? "yes" : "no";
					return result;
				}
				
				@PostMapping("updateMyInfoNickName.me")
				public String updateMyInfoNickName(@RequestParam("nickName") String nickName, @RequestParam("id") String id, Model model) { 
					
					Member m = (Member)model.getAttribute("loginUser");
					
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("memberId", id);
					map.put("memberNickName", nickName);
			
					int result = mService.updateMyInfoNickName(map);
					
					if(result > 0) {
						model.addAttribute("loginUser", mService.login(m)); 
						return "redirect:editMyInfo.me";
					} else {
						throw new MemberException("닉네임 수정이 실패하였습니다.");
					}
					
				}
				
				@PostMapping("updateMyInfoEmail.me")
				public String updateMyInfoEmail(@RequestParam("email") String email, @RequestParam("id") String id, Model model) { 
					
					Member m = (Member)model.getAttribute("loginUser");
					
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("memberId", id);
					map.put("memberEmail", email);
					
					int result = mService.updateMyInfoEmail(map);
					
					if(result > 0) {
						model.addAttribute("loginUser", mService.login(m)); 
						return "redirect:editMyInfo.me";
					} else {
						throw new MemberException("이메일 수정이 실패하였습니다.");
					}
					
				}
				
//				@PostMapping("updatePw.me")
//				public String updatePw(@RequestParam("newPwd") String pwd, @RequestParam("memberId") String id, Model model) {
//					
//					Member m = (Member)model.getAttribute("loginUser");
//					
//					HashMap<String, String> map = new HashMap<String, String>();
//					map.put("memberId", id);
//					map.put("newPwd", bcrypt.encode(pwd));
//					
//					int result = mService.updatePw(map);
//					
//					if(result > 0) {
//						model.addAttribute("loginuser", mService.login(m)); 
//						return "redirect:/";
//					} else {
//						throw new MemberException("비밀번호 수정이 실패하였습니다.");
//					}
//				}
				
				@PostMapping("updateMyInfoPwd.me")
				public String updateMyInfoPwd(@RequestParam("currentPwd") String currentPwd, @RequestParam("newPwd") String newPwd, Model model) { 
					
					Member m = (Member)model.getAttribute("loginUser");
					
					String id =  ((Member)model.getAttribute("loginUser")).getMemberId();
					String pwd = ((Member)model.getAttribute("loginUser")).getMemberPwd();
					
					System.out.println(id);
					System.out.println(pwd);
					
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("memberId", id);
					map.put("newPwd", bcrypt.encode(newPwd));
					
					if(bcrypt.matches(currentPwd, pwd)) {
						int result = mService.updatePw(map);
						
						if(result > 0) {
							model.addAttribute("loginUser", mService.login(m));
							return "redirect:/";
						} else {
							throw new MemberException("비밀번호 수정이 실패하였습니다.");
						}

					} else {
						throw new MemberException("비밀번호 수정이 실패하였습니다.");
					}
				}
//						if(result > 0) {
//							
//							HashMap<String, String> map = new HashMap<String, String>();
//							map.put("memberId", id);
//							map.put("memberPwd", NewPwd);
//							
//							int result1 = mService.updatePw(map);
//							
//							if(result1 > 0) {
//								model.addAttribute("loginUser", mService.login(m)); 
//								return "redirect:/";
//							} else {
//								throw new MemberException("비밀번호 수정이 실패하였습니다.");
//							}
//							
//						} else {		
//							throw new MemberException("비밀번호 수정이 실패하였습니다.");
//						}
				
				@PostMapping("deleteLeaveMember.me")
				public String deleteLeaveMember(@RequestParam("memberPwd") String currentPwd, Model model) {
					
					String id = ((Member)model.getAttribute("loginUser")).getMemberId();
					String pwd = ((Member)model.getAttribute("loginUser")).getMemberPwd();
					
					if(bcrypt.matches(currentPwd, pwd)) {
						int result = mService.deleteLeaveMember(id);
						return "redirect:logout.me";
					} else {
						throw new MemberException("회원탈퇴에 실패하였습니다.");
					}
				}
				
				@GetMapping("editMyInfo.me")
				public String editMyInfo() {
					return "edit";
				}
				
				@RequestMapping("leave.me")
				public String leave() {
					
					return "leave";
				}
			
				@GetMapping("myInfo.me")
				public String myInfoView(HttpSession session, Model model) {
					String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
					ArrayList<HashMap<String, Object>> list = mService.selectMyList(memberId);
					model.addAttribute("list",list);
					return "myPage";
				}
	
	@GetMapping("kakaoAddInfo.me")
	public String kakaoAddInfoView() {
		return "kakaoAddInfo";
	}
	
	@ResponseBody
	@RequestMapping("kakaoInfoInsert.me")
	public String kakaoInfoInsert(@ModelAttribute KakaoMember km, Model model) {
		km.setMemberNo(((KakaoMember)model.getAttribute("loginUser")).getMemberNo());
		km.setMemberId(((KakaoMember)model.getAttribute("loginUser")).getMemberId());
		System.out.println(km);
		int count = mService.updateKakaoInfo(km);
		if(count > 0) {
			KakaoMember loginUser = mService.selectKakaoMember(km);
			model.addAttribute("loginUser", loginUser);
		}
		String result = count > 0 ? "yes" : "no";
		return result;
	}
	
}
