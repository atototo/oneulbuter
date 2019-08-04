package com.ko.diet;


import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.ko.diet.Dao.LoginDao;
import com.ko.diet.common.Vo.MemberVo;
 
@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name="loginDao")
	private LoginDao loginDao;
	
	
	@Value("#{diet_prop['" + "drivers" +"']}")
	private String dbURL;
	
	// 프로퍼티 객체 주입
	@Resource(name = "diet_prop")
	private Properties diet_prop;

	
	// 메인 폼
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String MainForm(Model model, String msg, String err) {
		logger.info("########## Login Form 시작 ##########");
		logger.info(msg);
		logger.info(err);

		model.addAttribute("msg", msg);
	    model.addAttribute("err", err);
		logger.info("########## Login Form 종료 ##########");
		return "index";
	}
	
	
	// 로그인 폼
	@RequestMapping(value = "/login/login.do", method = RequestMethod.GET)
	public String LoginForm(Model model, String msg, String err) {
		logger.info("########## Login Form 시작 ##########");
		logger.info(msg);
		logger.info(err);

		model.addAttribute("msg", msg);
	    model.addAttribute("err", err);
		logger.info("########## Login Form 종료 ##########");
		return "login/login";
	}
	
	@RequestMapping(value = "/login/login_act.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String Loginact(Model model, String msg, String err, MemberVo memvo,HttpServletRequest request) {
		logger.info("########## Login act event 시작 ##########");
		String pageurl = "index";
		 HttpSession session = request.getSession();
		 session.removeAttribute("id"); // 특정된 정보만 제거하는 것
		 
		int logincnt =  loginDao.isLogin(memvo);
		
		if(logincnt <= 0) {
			logger.info("로그인 실패");
			msg = "로그인 실패 하였습니다.";
			pageurl =  "login/login";
		}else {
			session.setAttribute("loginUser", loginDao.getinform(memvo));
		}
		
		
		
		model.addAttribute("msg", msg);
	    model.addAttribute("err", err);
		logger.info("########## Login act event 종료 ##########");
		return pageurl;
	}
	@RequestMapping(value = "/login/resetpw_act.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String resetpwact(Model model, String msg, String err, MemberVo memvo,HttpServletRequest request) {
		logger.info("########## reset pw event 시작 ##########");
		String pageurl = "login/login";
		
	   String npw = memvo.getPhone().substring(memvo.getPhone().length()-4, memvo.getPhone().length());
	       memvo.setPwd(npw);
	         
		
		int logincnt =  loginDao.issetpw(memvo);
		
		if(logincnt <= 0) {
			logger.info("아이디, 이름, 혹은 전화번호 틀림");
			msg = "아이디, 이름 또는 전화번호가  틀렸습니다.";
			pageurl =  "login/login";
		}else {
			msg = "비밀번호가 초기 비밀번호로 리셋되었습니다.";
		}
		
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		logger.info("########## Login act event 종료 ##########");
		return pageurl;
	}
	
	
	// 로그인성공-임시
	@RequestMapping(value = "/index.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String ssoLoginForm(Model model, String msg, String err) {
		logger.info("########## index Form 시작 ##########");
		logger.info(msg);
		logger.info(err);

		model.addAttribute("msg", msg);
	    model.addAttribute("err", err);
		logger.info("########## index Form 종료 ##########");
		return "index";
	}
	// 관리자 페이지 
	@RequestMapping(value = "/admin/adminpage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String adminpageForm(Model model, String msg, String err, MemberVo memvo) {
		logger.info("########## page Form 시작 ##########");
		logger.info(msg);
		logger.info(err);
		List memlist = loginDao.getlist(memvo);
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("memlist", memlist);
		logger.info("########## index Form 종료 ##########");
		return "/admin/adminpage";
	}
	
	@RequestMapping(value = "/admin/sign_act.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String signact(Model model, String msg, String err, MemberVo memvo) {
		logger.info("########## sign act event 시작 ##########");
		  
		int insertcnt =  loginDao.insert_sign(memvo);
		
		if(insertcnt > 0) {
			msg = "가입자 등록 성공 하였습니다.";
		}else{
			msg = "가입자 등록 실패 하였습니다.";
		}
	
		
		model.addAttribute("msg", msg);
	    model.addAttribute("err", err);
	    model.addAttribute("url", "/admin/adminpage.do");
		logger.info("########## sign act event 종료 ##########");
		return "/common/redirect";
		//return "redirect:/admin/adminpage.do";
	}
	
	@RequestMapping(value = "/admin/sign_update.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateact(Model model, String msg, String err, MemberVo memvo) {
		logger.info("########## sign act event 시작 ##########");
		
		int insertcnt =  loginDao.update_sign(memvo);
		
		if(insertcnt > 0) {
			msg = "가입자 수정 성공 하였습니다.";
		}else{
			msg = "가입자 수정 실패 하였습니다.";
		}
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("url", "/admin/adminpage.do");
		logger.info("########## sign act event 종료 ##########");
		return "/common/redirect";
		//return "redirect:/admin/adminpage.do";
	}
	
	@RequestMapping(value = "/admin/del_act.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String delact(@RequestParam(value="delid", required=false) String[] nums, Model model, String msg, String err, MemberVo memvo ) {
		logger.info("########## delete act event 시작 ##########");
		int insertcnt = 0;
		int successcnt = 0;
		for(String adminid : nums) {
		logger.info(adminid);	
		insertcnt = loginDao.delete_member(adminid);
		successcnt++;
		}
		
		
		if(insertcnt > 0) {
			msg = successcnt+ "건 삭제 성공 하였습니다.";
		}else{
			msg = "삭제 실패 하였습니다.";
		}
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("url", "/admin/adminpage.do");
		logger.info("########## delete act event 종료 ##########");
		return "/common/redirect";
		//return "redirect:/admin/adminpage.do";
	}
	
	
	@RequestMapping(value = "/login/LogoutSession", method = {RequestMethod.GET,RequestMethod.POST})
	public String LogoutSession(Model model, HttpSession session) {
		logger.info("########## LogoutSession - 세션 만료로 로그아웃 ##########");
		
		  
		
		
		logger.info("########## LogoutSession - 세션 만료로 로그아웃 ##########");
		return "/login/logout_session";
	}
	@RequestMapping(value = "/login/Logout.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String Logoutact(Model model, HttpSession session) {
		logger.info("########## Logout 버튼 액션- 로그아웃 ##########");
		
		
		//session.removeAttribute("id"); // 특정된 정보만 제거하는 것
		session.invalidate();
		
		logger.info("########## Logout 버튼 액션 - 로그아웃 ##########");
		return "index";
	}

}

