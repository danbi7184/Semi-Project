package semi.proj.PfF.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import semi.proj.PfF.member.model.exception.MemberException;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	 @ExceptionHandler(MemberException.class)
	    public ModelAndView handleMemberException(HttpServletRequest request, MemberException ex) {
	        ModelAndView modelAndView = new ModelAndView();
	        modelAndView.setViewName("errorPage");
	        modelAndView.addObject("errorMessage", ex.getMessage());
	        return modelAndView;
	    }
	
}
