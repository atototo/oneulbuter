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

public class DietDao extends SqlSessionDaoSupport {
	private static final Logger logger = LoggerFactory
			.getLogger(DietDao.class);


	   public int insert_cal(CalorieVo vo)
	    {              
	       int result = 0;
	        try
	        {                       
	           result = getSqlSession().update("DietMap.insert_cal", vo);                   
	           
	        } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
	        return result;
	    }
	
	

	   public List<Kseq_categoryrVo> getkseq_categorylist()
       {              
          List<Kseq_categoryrVo> list = null;
           try
           {           
              list = getSqlSession().selectList("DietMap.getkseq_categorylist");                   
              
           } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
           return list;
       }
	
	   public List<UnitlistVo> getunitist(UnitlistVo vo)
	   {              
		   List<UnitlistVo> list = null;
		   try
		   {           
			   list = getSqlSession().selectList("DietMap.getunitlist", vo);                   
			   
		   } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
		   return list;
	   }
	   
	   public List<CalorieVo> getlist()
       {              
          List<CalorieVo> list = null;
           try
           {           
              list = getSqlSession().selectList("DietMap.iscallist");                   
              
           } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
           return list;
       }
	   
	   public List<CalorieVo> get_findcallist(CalorieVo vo)
	   {              
		   List<CalorieVo> list = null;
		   try
		   {           
			   list = getSqlSession().selectList("DietMap.is_findcallist", vo);                   
			   
		   } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
		   return list;
	   }
	   
	   public CalorieVo getcalinform(CalorieVo vo)
	   {              
		   try
		   {           
			 vo = getSqlSession().selectOne("DietMap.get_calinform", vo);     
			             
			   
		   } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
		   return vo;
	   }
	   
	  
	   public int insert_calimg(CalorieVo vo)
	   {              
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.update_calimg", vo);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
	   }
	   
	   public List<RecipeVo> getrecipe_list(RecipeVo vo)
	   {      
		   List<RecipeVo> list = null;
		   try
		   {           
			 list = getSqlSession().selectList("DietMap.get_recipelist", vo);     
			             
			   
		   } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
		   return list;
	   }
	   
	   public int insert_comments(CommentsVo vo) {
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.insert_comments", vo);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
		   
	   }
	   
	   public List<CommentsVo> getcmt_list(CommentsVo vo)
	   {      
		   List<CommentsVo> list = null;
		   try
		   {           
			 list = getSqlSession().selectList("DietMap.cmtlist", vo);     
			             
		 } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
		   return list;
	   }
	   
	   public int check_rseq(int fseq)
	   {
		   int rseq = 0;
		   try {
			   rseq = getSqlSession().selectOne("DietMap.check_rseq", fseq); 
		   }catch(Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return rseq;
	   }
	   
	   public int insert_recipe(RecipeVo vo) {
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.insert_recipe", vo);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
		   
	   }
	   public int update_recipe(RecipeVo vo) {
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.update_recipe", vo);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
		   
	   }
	   
	   public int update_calunitnum(CalorieVo vo) {
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.update_calunitnum", vo);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
		   
	   }
	   
	   public int get_unit(String unitname)
	   {
		   int unitnum = 0;
		   try {
			   unitnum = getSqlSession().selectOne("DietMap.get_unitnum", unitname); 
		   }catch(Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return unitnum;
	   }
	   
	   
	   public int update_cal(CalorieVo vo)
	    {              
	       int result = 0;
	        try
	        {                       
	           result = getSqlSession().update("DietMap.update_cal", vo);                   
	           
	        } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
	        return result;
	    }
	   
	   public int delete_comment(String coindex)
	   {              
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.delete_comment", coindex);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
	   }
	   public int delete_recipe(String rseq)
	   {              
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.delete_recipe", rseq);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
	   }
	   public int delete_calorie(String fseq)
	   {              
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.delete_calorie", fseq);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
	   }
	   
	   
	   public int check_dmseq()
	   {
		   int rseq = 0;
		   try {
			   rseq = getSqlSession().selectOne("DietMap.check_dmseq"); 
		   }catch(Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return rseq;
	   }
	   
	   
	   public int register_dm(DietmenuVo vo) {
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.register_dm", vo);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
		   
	   }
	   
	   public DietmenuVo getdminform(DietmenuVo vo)
	   {              
		   try
		   {           
			 vo = getSqlSession().selectOne("DietMap.get_dminform", vo);     
			             
			   
		   } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
		   return vo;
	   }
	   
	   public int check_htseq()
	   {
		   int rseq = 0;
		   try {
			   rseq = getSqlSession().selectOne("DietMap.check_htseq"); 
		   }catch(Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return rseq;
	   }
	   
	   public int register_ht(HometVo vo) {
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.register_ht", vo);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
		   
	   }
	   
	   
	   
	   public HometVo gethtinform(HometVo vo)
	   {              
		   try
		   {           
			 vo = getSqlSession().selectOne("DietMap.get_htinform", vo);     
			             
			   
		   } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
		   return vo;
	   }
	   
	   
	   public List<TiplistVo> gettiplist()
       {              
          List<TiplistVo> list = null;
           try
           {           
              list = getSqlSession().selectList("DietMap.is_tiplist");                   
              
           } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
           return list;
       }
	   
	   public int update_ht(HometVo vo)
	    {              
	       int result = 0;
	        try
	        {                       
	           result = getSqlSession().update("DietMap.update_ht", vo);                   
	           
	        } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
	        return result;
	    }
	   
	   public int update_dm(DietmenuVo vo)
	   {              
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.update_dm", vo);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
	   }
	   
	   public int delete_httip(String idx)
	   {              
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.delete_httip", idx);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
	   }
	   public int delete_dmtip(String idx)
	   {              
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.delete_dmtip", idx);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
	   }
	   
	   public List<TiplistVo> gethtlist()
       {              
          List<TiplistVo> list = null;
           try
           {           
              list = getSqlSession().selectList("DietMap.ishtlist");                   
              
           } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
           return list;
       }
	   public List<TiplistVo> getdmlist()
	   {              
		   List<TiplistVo> list = null;
		   try
		   {           
			   list = getSqlSession().selectList("DietMap.isdmlist");                   
			   
		   } catch (Exception e) { logger.debug("ERROR : " + e.toString()); }
		   return list;
	   }
	   
	   
	   public int delete_comments(CommentsVo covo)
	   {              
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.delete_comments", covo);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
	   }
	   public int update_comments(CommentsVo covo)
	   {              
		   int result = 0;
		   try
		   {                       
			   result = getSqlSession().update("DietMap.update_comments", covo);                   
			   
		   } catch (Exception e){ logger.debug("ERROR : " + e.toString()); }
		   return result;
	   }
	   
}
