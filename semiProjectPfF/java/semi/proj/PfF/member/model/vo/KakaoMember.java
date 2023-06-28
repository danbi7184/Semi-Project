package semi.proj.PfF.member.model.vo;

import java.sql.Date;

public class KakaoMember {
	private int memberNo;
	private long memberId;
	private String memberName;
	private String memberNickName;
	private String memberHomePhone;
	private String memberPhone;
	private String memberAddress;
	private String memberEmail;
	private Date enrollDate;
	private int point;
	private int payAmount;
	private String grade;
	private String admin;
	private char memberStatus;
	
	public KakaoMember() {}

	public KakaoMember(int memberNo, long memberId, String memberName, String memberNickName, String memberHomePhone,
			String memberPhone, String memberAddress, String memberEmail, Date enrollDate, int point, int payAmount,
			String grade, String admin, char memberStatus) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberNickName = memberNickName;
		this.memberHomePhone = memberHomePhone;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.memberEmail = memberEmail;
		this.enrollDate = enrollDate;
		this.point = point;
		this.payAmount = payAmount;
		this.grade = grade;
		this.admin = admin;
		this.memberStatus = memberStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public long getMemberId() {
		return memberId;
	}

	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNickName() {
		return memberNickName;
	}

	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}

	public String getMemberHomePhone() {
		return memberHomePhone;
	}

	public void setMemberHomePhone(String memberHomePhone) {
		this.memberHomePhone = memberHomePhone;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public char getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(char memberStatus) {
		this.memberStatus = memberStatus;
	}

	@Override
	public String toString() {
		return "KakaoMember [memberNo=" + memberNo + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", memberNickName=" + memberNickName + ", memberHomePhone=" + memberHomePhone + ", memberPhone="
				+ memberPhone + ", memberAddress=" + memberAddress + ", memberEmail=" + memberEmail + ", enrollDate="
				+ enrollDate + ", point=" + point + ", payAmount=" + payAmount + ", grade=" + grade + ", admin=" + admin
				+ ", memberStatus=" + memberStatus + "]";
	}

}
