/*
 *  INSUP-2 version 1.0
 * 
 *  Copyright ⓒ [2014] kt corp. All rights reserved.
 *
 *  This is a proprietary software of kt corp, and you may not use this file except in
 *  compliance with license agreement with kt corp. Any redistribution or use of this
 *  software, with or without modification shall be strictly prohibited without prior written
 *  approval of kt corp, and the copyright notice above does not evidence any actual or
 *  intended publication of such software.
 * 
 *	1. 패키지명			: com.kt.ems.common.Dao
 *	2. 파일명			: LoginDao.java
 * 	3. 작성일        	: 2014. 4. 7. 오후 6:12:42
 *	4. 작성자        	: 김덕원 ( dukwon81@gmail.com ) / 미래손
 * 	5. 설명          	: 로그인 관련 DAO
 *
 */

package com.ko.diet.Dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.ko.diet.common.Util.Cipher;
import com.ko.diet.common.Util.StringSeparator;
import com.ko.diet.common.Util.UtilBean;
import com.ko.diet.common.Vo.*;

public class LoginDao extends SqlSessionDaoSupport {
	private static final Logger logger = LoggerFactory
			.getLogger(LoginDao.class);



	/* 관리자 로그인 */
 	public int isLogin(MemberVo vo)
    {    	    	
    	int totalCount = 0;
        try
        {     
        	totalCount = getSqlSession().selectOne("LoginMap.isLogin", vo);        	        
        	
        } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
        return totalCount;
    }
 	

	 public MemberVo getinform(MemberVo vo)
     {              
        MemberVo main = null;
         try
         {                       
            main = getSqlSession().selectOne("LoginMap.isinform", vo);                   
            
         } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
         return main;
     }
	 
	   public List<MemberVo> getlist(MemberVo vo)
       {              
          List<MemberVo> list = null;
           try
           {           
              list = getSqlSession().selectList("LoginMap.islist", vo);                   
              
           } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
           return list;
       }

	   public int insert_sign(MemberVo vo)
	    {              
	       int result = 0;
	        try
	        {                       
	           result = getSqlSession().update("LoginMap.insert_sign", vo);                   
	           
	        } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
	        return result;
	    }
 	 
	   public int update_sign(MemberVo vo)
	    {              
	       int result = 0;
	        try
	        {                       
	           result = getSqlSession().update("LoginMap.update_sign", vo);                   
	           
	        } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
	        return result;
	    }
	   public int delete_member(String id)
	   {              
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("LoginMap.delete_member", id);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
	   }
	   
	   public int issetpw(MemberVo vo)
	    {              
	       int result = 0;
	        try
	        {                       
	           result = getSqlSession().update("LoginMap.reset_pwd", vo);                   
	           
	        } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
	        return result;
	   
	   
	    }	   
	   
}
