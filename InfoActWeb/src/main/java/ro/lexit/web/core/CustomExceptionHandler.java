package ro.lexit.web.core;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import ro.lexit.web.exceptions.EroareAutorizare;

@ControllerAdvice
public class CustomExceptionHandler {
	
	@ExceptionHandler(value = Exception.class)
	public ModelAndView handleException(HttpServletRequest req, Exception e) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", e);
		mav.addObject("url", req.getRequestURL());   
		mav.setViewName("err/error");
		return mav;
	}
	
	@ExceptionHandler(value = EroareAutorizare.class)
	public ModelAndView handleAuthError(HttpServletRequest req, Exception e) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addObject("entityCode", ((EroareAutorizare) e).getEntityCode());
		mav.addObject("grant", ((EroareAutorizare) e).getGrant());
		mav.setViewName("err/accessDenied");			
		return mav;
	}	
	
}
