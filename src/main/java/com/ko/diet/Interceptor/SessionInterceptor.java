package com.ko.diet.Interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ko.diet.common.Vo.MemberVo;


public class SessionInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler ) throws IOException{
		//logger.info("preInteceptor");
		// session check
		//HttpSession session = request.getSession(false);
		
		HttpSession session = request.getSession();


		MemberVo vo = (MemberVo) session.getAttribute("loginUser"); 
		
		if("/".equals(request.getRequestURI())) return true;
		if("//".equals(request.getRequestURI())) return true;

		if(request.getRequestURI().contains("/customer")) return true;
		if(request.getRequestURI().contains("/common")) return true;
		if(request.getRequestURI().contains("/login")) return true;
		if(request.getRequestURI().contains("/index")) return true;
		if(request.getRequestURI().contains("/example")) return true;
		if(request.getRequestURI().contains("/include")) return true;
		if(request.getRequestURI().contains("/pointer-master")) return true;
	
		
		if(!"/login/LogoutSession".equals(request.getRequestURI())){
			if(vo == null){
				logger.info("session == null");
				logger.info("preHandle session invalidate");
				response.sendRedirect("/login/LogoutSession");
				return false;
			}	
			return true;
		}
		
	

		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		//
		
	}

}
