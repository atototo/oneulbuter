package com.ko.diet;


import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.ko.diet.Dao.DietDao;
import com.ko.diet.Dao.LoginDao;
import com.ko.diet.common.Util.FileUploadService;
import com.ko.diet.common.Vo.CalorieVo;
import com.ko.diet.common.Vo.CommentsVo;
import com.ko.diet.common.Vo.DietmenuVo;
import com.ko.diet.common.Vo.HometVo;
import com.ko.diet.common.Vo.Kseq_categoryrVo;
import com.ko.diet.common.Vo.MemberVo;
import com.ko.diet.common.Vo.RecipeVo;
import com.ko.diet.common.Vo.TiplistVo;
import com.ko.diet.common.Vo.UnitlistVo;
 
@Controller
public class DietController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name="loginDao")
	private LoginDao loginDao;
	
	@Resource(name="dietDao")
	private DietDao dietDao;
	
	
	@Value("#{diet_prop['" + "drivers" +"']}")
	private String dbURL;
	
	// 프로퍼티 객체 주입
	@Resource(name = "diet_prop")
	private Properties diet_prop;

	@Autowired
	FileUploadService fileUploadService;
	
	// 메인 폼
	@RequestMapping(value = "/customer/DietTip.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String tipForm(Model model, String msg, String err, TiplistVo tivo) {
		logger.info("########## DietTip 시작 ##########");
		logger.info(msg);
		logger.info(err);

		
		List tiplist = dietDao.gettiplist();
		
		
		
		model.addAttribute("msg", msg);
	    model.addAttribute("err", err);
	    model.addAttribute("tiplist", tiplist);
	    
		logger.info("########## DietTip 종료 ##########");
		return "/customer/DietTip";
	}
	
	// 다이어트 팁 종류별로 보여주는 로직
	@RequestMapping(value = "/customer/diettipkind.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String tipForm(Model model, String msg, String err, @RequestParam("tipkind") String tipkind ) {
		logger.info("########## DietTip 시작 ##########");
		logger.info(msg);
		logger.info(err);
		List tiplist = null;
		if(tipkind.equals("ht")) {
			tiplist = dietDao.gethtlist();
		}else {
			tiplist = dietDao.getdmlist();
		}
		
		
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("tiplist", tiplist);
		
		logger.info("########## DietTip 종료 ##########");
		return "/customer/DietTip";
	}
	
 	@RequestMapping(value = "/customer/mainindex.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String MainForm(Model model, String msg, String err) {
		logger.info("########## customer main 시작 ##########");
		logger.info(msg);
		logger.info(err);
	
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		logger.info("########## customer main 종료 ##########");
		return "index";
	}
	@RequestMapping(value = "/customer/Dictionary.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String dictionaryForm(Model model, String msg, String err, Kseq_categoryrVo Kseq_categoryrVo) {
		logger.info("########## customer dictionary 시작 ##########");
		logger.info(msg);
		logger.info(err);
		
		List kseqlist = dietDao.getkseq_categorylist();
		List calorielist = dietDao.getlist();
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("kseqlist", kseqlist);
		model.addAttribute("calorielist", calorielist);
		
		logger.info("########## customer dictionary 종료 ##########");
		return "customer/Dictionary";
	}
	 /*Dictionaryl 검색*/
	@RequestMapping(value = "customer/find_cal.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String dictionaryserchorm(Model model, String msg, String err, Kseq_categoryrVo Kseq_categoryrVo
			, @RequestParam("kseq") String kseq,  @RequestParam("fname") String fname, CalorieVo cavo) {
		logger.info("########## customer dictionary 검색 시작 ##########");
		logger.info(msg);
		logger.info(err);
		logger.info("kseq 파라미터 확인  ******   "+kseq);
		
		 cavo.setKseq(Integer.parseInt(kseq));
		 if(fname == "") {
			 fname = "%";
			 cavo.setFname(fname);
			 
		 }else {
			 cavo.setFname(fname);
		 }
		 
		List kseqlist = dietDao.getkseq_categorylist();
		List calorielist = dietDao.get_findcallist(cavo);
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("kseqlist", kseqlist);
		model.addAttribute("calorielist", calorielist);
		
		logger.info("########## customer dictionary 검색 종료 ##########");
		return "customer/Dictionary";
	}
	
	@RequestMapping(value = "/customer/DMDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String dmdetailyForm(Model model, String msg, String err, @RequestParam("dmseq") String dmseq, DietmenuVo dmvo) {
		logger.info("########## customer dmdetail 시작 ##########");
		logger.info(msg);
		logger.info(err);
        
		dmvo.setDmseq(dmseq);
		dmvo = dietDao.getdminform(dmvo);
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("dmvo", dmvo);
		logger.info("########## customer dmdetail 종료 ##########");
		return "customer/DMDetail";
	}
	
	@RequestMapping(value = "/customer/FoodDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String fooddetailForm(Model model, String msg, String err,@RequestParam("fseq") String fseq, 
			CalorieVo calvo, RecipeVo revo, CommentsVo covo, UnitlistVo unitlistvo) {
		logger.info("########## customer fooddetail 시작 ##########");
		logger.info(msg);
		logger.info(err);
        logger.info("fseq 확인 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+fseq);
        if(fseq.length()>2) {
         fseq = fseq.substring(0, 2);
        }
		int fnum = Integer.parseInt(fseq);
		calvo.setFseq(fseq);
		revo.setFseq(fnum);
		covo.setFseq(fnum);
		calvo = dietDao.getcalinform(calvo);
		
		List recipelist = dietDao.getrecipe_list(revo); 
		List commentslist = dietDao.getcmt_list(covo);
		List unitlist = dietDao.getunitist(unitlistvo);
		
		
	
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("calvo", calvo);
		model.addAttribute("unitlist", unitlist);
		model.addAttribute("recipelist", recipelist);
		model.addAttribute("commentslist", commentslist);
		logger.info("########## customer fooddetial 종료 ##########");
		return "customer/FoodDetail";
	}
	
	@RequestMapping(value = "/customer/HTDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String htdetailForm(Model model, String msg, String err, @RequestParam("htseq") String htseq,HometVo hovo) {
		logger.info("########## customer htdetail 시작 ##########");
		logger.info(msg);
		logger.info(err);
	
		
		hovo.setHtseq(htseq);;
		hovo = dietDao.gethtinform(hovo);
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("hovo", hovo);
		logger.info("########## customer htdetail 종료 ##########");
		return "customer/HTDetail";
	}
	
	@RequestMapping(value = "/admin/insert_cal.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String calorieinsertForm(Model model, String msg, String err,Kseq_categoryrVo Kseq_categoryrVo, UnitlistVo unitlistvo) {
		logger.info("########## calorie insert form 시작 ##########");
		logger.info(msg);
		logger.info(err);
		
		List kseqlist = dietDao.getkseq_categorylist();
		List unitlist = dietDao.getunitist(unitlistvo);
		
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("kseqlist", kseqlist);
		model.addAttribute("unitlist", unitlist);
		logger.info("########## calorie insert form 종료 ##########");
		return "admin/admin_food_register";
	}
	
	@RequestMapping(value = "/admin/register_cal.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String reigstercal(Model model, String msg, String err, CalorieVo calvo) {
		logger.info("########## calorie register event 시작 ##########");
		  
		int insertcnt =  dietDao.insert_cal(calvo);
		
		if(insertcnt > 0) {
			msg = "등록 성공 하였습니다.";
		}else{
			msg = "등록 실패 하였습니다.";
		}
	
		
		model.addAttribute("msg", msg);
	    model.addAttribute("err", err);
	    model.addAttribute("url", "/customer/Dictionary.do");
		logger.info("########## calorie register event 종료 ##########");
		return "/common/redirect";
		//return "redirect:/admin/adminpage.do";
	}
	
	
	@RequestMapping( "/form.do" )
	public String form() {
		return "form";
	} 
	
/*	@RequestMapping( "/upload.do" )
	public String upload(
			Model model,
			@RequestParam("fseq") String fseq,
			@RequestParam("filename") String filename,
			@RequestParam("file1") MultipartFile file) {
		
		String url = fileUploadService.restore(file,diet_prop.getProperty("filedir"), filename);
		DB update 문 추가
		
		vo.setimg('include/uploadimg/'+filename)
		update calorie set img= ${img} where fseq=${fseq}
		->
		101.jpg
		
		*//*********************//*
		model.addAttribute("url", url);
		return "result";
	}*/
   /*대표 이미지 넣는곳 +01*/
	@RequestMapping(value = "/uploadfoodimg.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String uploadfoodimg(
			Model model,CalorieVo calvo,
	
			@RequestParam("file1") MultipartFile file) {
		
		logger.info("########## calorie img upload event 시작 ##########");
		//int fnum = Integer.parseInt(fseq);
	    String fseq = calvo.getFseq();
		String imgname = "food_"+fseq+"01";
		String url = fileUploadService.restore(file,diet_prop.getProperty("filedir"), imgname );
		
		/*DB update 문 추가*/
		/*
		vo.setimg('include/uploadimg/'+filename)
		update calorie set img= ${img} where fseq=${fseq}
		->
		101.jpg
		*/
		/*********************/
		calvo.setFseq(fseq);
		calvo.setImg(url);
		fseq = calvo.getFseq();
		int insertimg =  dietDao.insert_calimg(calvo);
		model.addAttribute("url", url);
		model.addAttribute("url",  "customer/FoodDetail.do?fseq="+fseq);
		 return "/common/redirect";
	}

/*	@RequestMapping(value = "/customer/insert_comments.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateact(Model model, String msg, String err, CommentsVo covo) {
		logger.info("########## comments insert event 시작 ##########");
		
		int insertcnt =  dietDao.insert_comments(covo);
		
		if(insertcnt > 0) {
			msg = "등록 성공 하였습니다.";
		}else{
			msg = "등록 실패 하였습니다.";
		}
		logger.debug(err);
		int fnum = covo.getFseq();
		
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("url",  "/customer/FoodDetail.do?fseq="+fnum);
		logger.info("########## comments insert event 종료 ##########");
		return "/common/redirect";
		//return "redirect:/admin/adminpage.do";
	}*/
	
	@RequestMapping(value = "/customer/insert_comments.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateact(Model model, String msg, String err, CalorieVo calvo, String fseq, CommentsVo covo) {
		logger.info("########## comments insert event 시작 ##########");
		
		int insertcnt =  dietDao.insert_comments(covo);
		
		if(insertcnt > 0) {
			msg = "등록 성공 하였습니다.";
		}else{
			msg = "등록 실패 하였습니다.";
		}
		int fnum = covo.getFseq();
		
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("url",  "/customer/FoodDetail.do?fseq="+fnum);
		logger.info("########## comments insert event 종료 ##########");
		return "/common/redirect";
		//return "redirect:/admin/adminpage.do";
	}
	
	
	@RequestMapping(value = "/uploadrecipe.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String calorieinsertForm(Model model, String msg, String err,CalorieVo calvo, CommentsVo covo, RecipeVo revo,
			@RequestParam("fseq") String fseq, @RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2
			,@RequestParam("file3") MultipartFile file3,@RequestParam("file4") MultipartFile file4,
			@RequestParam("file5") MultipartFile file5, @RequestParam("file6") MultipartFile file6) {
		logger.info("########## recipe insert  시작 ##########");
		logger.info(msg);
		logger.info(err);
		//List kseqlist = dietDao.getkseq_categorylist(Kseq_categoryrVo);
		int fnum = Integer.parseInt(fseq);
		revo.setFseq(fnum);
		int rseq = dietDao.check_rseq(fnum);
		String imgname1, imgname2, imgname3, imgname4, imgname5, imgname6;
		String url1, url2, url3, url4, url5, url6;
		if(rseq==0) {
			rseq=1;
			imgname1 = "foodrecipe_"+fnum+"01";
			imgname2 = "recipe_"+rseq+"01";
			imgname3 = "recipe_"+rseq+"02";
			imgname4 = "recipe_"+rseq+"03";
			imgname5 = "recipe_"+rseq+"04";
			imgname6 = "recipe_"+rseq+"05";
		}else {
			rseq+=1;
			imgname1 = "foodrecipe_"+fnum+("0"+rseq);
			imgname2 = "recipe_"+rseq+"01";
			imgname3 = "recipe_"+rseq+"02";
			imgname4 = "recipe_"+rseq+"03";
			imgname5 = "recipe_"+rseq+"04";
			imgname6 = "recipe_"+rseq+"05";
		}
		
	
		if(!file1.isEmpty()) {
			url1 = fileUploadService.restore(file1,diet_prop.getProperty("filedir"), imgname1 );
			revo.setImg(url1);;
		}
		if(!file2.isEmpty()) {
			url2 = fileUploadService.restore(file2,diet_prop.getProperty("filedir"), imgname2 );
			revo.setHtm_img1(url2);
		}
		if(!file3.isEmpty()) {
			url3 = fileUploadService.restore(file3,diet_prop.getProperty("filedir"), imgname3 );
			revo.setHtm_img2(url3);
		}
		if(!file4.isEmpty()) {
			url4 = fileUploadService.restore(file4,diet_prop.getProperty("filedir"), imgname4 );
			revo.setHtm_img3(url4);
		}
		if(!file5.isEmpty()) {
			url5 = fileUploadService.restore(file5,diet_prop.getProperty("filedir"), imgname5 );
			revo.setHtm_img4(url5);
		}
		if(!file6.isEmpty()) {
			url6 = fileUploadService.restore(file6,diet_prop.getProperty("filedir"), imgname6 );
			revo.setHtm_img5(url6);
		}else {
			url6 =null;
		}
		
	
		int inserrecipe =  dietDao.insert_recipe(revo);
		
		if(inserrecipe > 0) {
			msg = "등록 성공 하였습니다.";
		}else{
			msg = "등록 실패 하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("url",  "/customer/FoodDetail.do?fseq="+fnum);
		logger.info("########## recipe insert 종료 ##########");
		return "/common/redirect";
	}

	
	@RequestMapping(value = "/updaterecipe.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String recipeupdate(Model model, String msg, String err,CalorieVo calvo, CommentsVo covo, RecipeVo revo, 
			@RequestParam("fseq") String fseq,  	@RequestParam("rseq") String rseq,@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2
			,@RequestParam("file3") MultipartFile file3,@RequestParam("file4") MultipartFile file4,
			@RequestParam("file5") MultipartFile file5, @RequestParam("file6") MultipartFile file6) {
		logger.info("########## recipe update  시작 ##########");
		logger.info(msg);
		logger.info(err);
		//List kseqlist = dietDao.getkseq_categorylist(Kseq_categoryrVo);
		int fnum = Integer.parseInt(fseq);
		int rnum = Integer.parseInt(rseq);
		revo.setFseq(fnum);
		revo.setRseq(rnum);
		String imgname1, imgname2, imgname3, imgname4, imgname5, imgname6;
		String url1, url2, url3, url4, url5, url6;
		
			imgname1 = "foodrecipe_"+fnum+("0"+rnum);
			imgname2 = "recipe_"+rnum+"01";
			imgname3 = "recipe_"+rnum+"02";
			imgname4 = "recipe_"+rnum+"03";
			imgname5 = "recipe_"+rnum+"04";
			imgname6 = "recipe_"+rnum+"05";
		
		if(!file1.isEmpty()) {
			url1 = fileUploadService.restore(file1,diet_prop.getProperty("filedir"), imgname1 );
			revo.setImg(url1);;
		}
		if(!file2.isEmpty()) {
			url2 = fileUploadService.restore(file2,diet_prop.getProperty("filedir"), imgname2 );
			revo.setHtm_img1(url2);
		}
		if(!file3.isEmpty()) {
			url3 = fileUploadService.restore(file3,diet_prop.getProperty("filedir"), imgname3 );
			revo.setHtm_img2(url3);
		}
		if(!file4.isEmpty()) {
			url4 = fileUploadService.restore(file4,diet_prop.getProperty("filedir"), imgname4 );
			revo.setHtm_img3(url4);
		}
		if(!file5.isEmpty()) {
			url5 = fileUploadService.restore(file5,diet_prop.getProperty("filedir"), imgname5 );
			revo.setHtm_img4(url5);
		}
		if(!file6.isEmpty()) {
			url6 = fileUploadService.restore(file6,diet_prop.getProperty("filedir"), imgname6 );
			revo.setHtm_img5(url6);
		}else {
			url6 =null;
		}
		
	
		int updaterecipe =  dietDao.update_recipe(revo);
		
		if(updaterecipe > 0) {
			msg = "등록 성공 하였습니다.";
		}else{
			msg = "등록 실패 하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("url",  "/customer/FoodDetail.do?fseq="+fnum);
		logger.info("########## recipe update 종료 ##########");
		return "/common/redirect";
	}
	
	
	@RequestMapping(value = "/admin/update_calform.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateact(Model model, String msg, String err, 
			CalorieVo calvo, Kseq_categoryrVo Kseq_categoryrVo, UnitlistVo unitlistvo, @RequestParam("fseq") String fseq) {
		logger.info("########## calorie update form 시작 ##########");
		logger.info(msg);
		logger.info(err);
		String unit = calvo.getUnit();
		int unitnum = dietDao.get_unit(unit);
		int fnum = Integer.parseInt(fseq);
		calvo.setFseq(fseq);
		calvo.setUnitnum(unitnum);
		//int calunitnum = dietDao.update_calunitnum(calvo);
		
		calvo = dietDao.getcalinform(calvo);
		List kseqlist = dietDao.getkseq_categorylist();
		List unitlist = dietDao.getunitist(unitlistvo);
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("calvo", calvo);
		model.addAttribute("unitlist", unitlist);
		model.addAttribute("kseqlist", kseqlist);
		logger.info("########## calorie update form 종료 ##########");
		return "admin/admin_food_update";
	}
	
	@RequestMapping(value = "/admin/update_cal.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String calinformupdate(Model model, String msg, String err, CalorieVo calvo ) {
		logger.info("########## calorie update  시작 ##########");
		logger.info(msg);
		logger.info(err);
	
         int insertcnt =  dietDao.update_cal(calvo);
		
		if(insertcnt > 0) {
			msg = "수정 성공 하였습니다.";
		}else{
			msg = "수정 실패 하였습니다.";
		} 
		 int fnum = Integer.parseInt(calvo.getFseq());

		
		model.addAttribute("msg", msg);
		model.addAttribute("err", err);
		model.addAttribute("url",  "/customer/FoodDetail.do?fseq="+fnum);
		logger.info("########## calorie update 종료 ##########");
		return "/common/redirect";
	}
	
	// 관리자 코멘트 리스트 페이지 
		@RequestMapping(value = "/admin/comment_listform.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String adminpageForm(Model model, String msg, String err, CommentsVo covo, @RequestParam("fseq") String fseq) {
			logger.info("########## comments list Form 시작 ##########");
			logger.info(msg);
			logger.info(err);
			covo.setFseq(Integer.parseInt(fseq));
			List colist = dietDao.getcmt_list(covo);
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("colist", colist);
			model.addAttribute("fseq", covo.getFseq());
			
			logger.info("########## comments list Form 종료 ##########");
			return "admin/admin_comments_list";
		}
	
		@RequestMapping(value = "/admin/delcmt_act.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String delact(@RequestParam(value="delid", required=false) String[] nums, Model model, String msg, String err, CommentsVo covo ) {
			logger.info("########## delete comment act event 시작 ##########");
			int insertcnt = 0;
			int successcnt = 0;
			for(String coindex : nums) {
			logger.info(coindex);	
			insertcnt = dietDao.delete_comment(coindex);
			successcnt++;
			}
			
			
			if(insertcnt > 0) {
				msg = successcnt+ "건 삭제 성공 하였습니다.";
			}else{
				msg = "삭제 실패 하였습니다.";
			}
			
			String fseq = Integer.toString(covo.getFseq());
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("url", "/admin/comment_listform.do?fseq="+fseq);
			logger.info("########## delete act event 종료 ##########");
			return "/common/redirect";
			//return "redirect:/admin/adminpage.do";
		}
		@RequestMapping(value = "/admin/delrecipe_act.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String delrecipeact(@RequestParam(value="delid", required=false) String[] nums, Model model, String msg, String err, RecipeVo revo ) {
			logger.info("########## delete recipe act event 시작 ##########");
			int insertcnt = 0;
			int successcnt = 0;
			String fseq = Integer.toString(revo.getFseq());
			
			logger.info("삭제시 이동하는 위치 확인 : >>>>>>>>>>>>>>>  "+ fseq);
			for(String rseq : nums) {
				logger.info(rseq);	
				insertcnt = dietDao.delete_recipe(rseq);
				successcnt++;
			}
			
			
			if(insertcnt > 0) {
				msg = successcnt+ "건 삭제 성공 하였습니다.";
			}else{
				msg = "삭제 실패 하였습니다.";
			}
			
		
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("url", "/customer/FoodDetail.do?fseq="+fseq);
			logger.info("########## delete  recipe act event 종료 ##########");
			return "/common/redirect";
			//return "redirect:/admin/adminpage.do";
		}
		@RequestMapping(value = "/admin/delcalorie_act.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String delcalact(@RequestParam(value="delid", required=false) String[] nums, Model model, String msg, String err, CalorieVo calvo ) {
			logger.info("########## delete calorie act event 시작 ##########");
			int insertcnt = 0;
			int successcnt = 0;
			for(String fseq : nums) {
				logger.info(fseq);	
				insertcnt = dietDao.delete_calorie(fseq);
				successcnt++;
			}
			
			
			if(insertcnt > 0) {
				msg = successcnt+ "건 삭제 성공 하였습니다.";
			}else{
				msg = "삭제 실패 하였습니다.";
			}
			
		
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("url", "/customer/Dictionary.do");
			logger.info("########## delete  calorie  act event 종료 ##########");
			return "/common/redirect";
			//return "redirect:/admin/adminpage.do";
		}
		
		
		@RequestMapping(value = "/admin/insert_dmform.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String dmregisterForm(Model model, String msg, String err,Kseq_categoryrVo Kseq_categoryrVo, UnitlistVo unitlistvo) {
			logger.info("########## Diet Menu insert form 시작 ##########");
			logger.info(msg);
			logger.info(err);
			
		/*	List kseqlist = dietDao.getkseq_categorylist(Kseq_categoryrVo);
			List unitlist = dietDao.getunitist(unitlistvo);
			*/
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			/*model.addAttribute("kseqlist", kseqlist);
			model.addAttribute("unitlist", unitlist);
			*/logger.info("########## calorie insert form 종료 ##########");
			return "admin/admin_dm_register";
		}
		
		
		
		
		@RequestMapping(value = "/admin/register_dm.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String dmregister(Model model, String msg, String err,DietmenuVo dmvo, @RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2) {
			logger.info("########## Diet Menu register  시작 ##########");
			logger.info(msg);
			logger.info(err);
		
			
			int dmseq = dietDao.check_dmseq();
			String imgname1, imgname2;
			String url1, url2;
			if(dmseq==0) {
				dmseq=1;
				imgname1 = "dm"+dmseq+"01";
				imgname2 = "dm"+dmseq+"02";
			}else {
				dmseq+=1;
				imgname1 = "dm"+dmseq+("01");
				imgname2 = "dm_"+dmseq+"02";
			}
			
		
			if(!file1.isEmpty()) {
				url1 = fileUploadService.restore(file1,diet_prop.getProperty("filedir"), imgname1 );
				dmvo.setImg(url1);;
			}
			if(!file2.isEmpty()) {
				url2 = fileUploadService.restore(file2,diet_prop.getProperty("filedir"), imgname2 );
				dmvo.setDetail_img(url2);
			}
			
		
			int registerdm =  dietDao.register_dm(dmvo);
			
			if(registerdm > 0) {
				msg = "등록 성공 하였습니다.";
			}else{
				msg = "등록 실패 하였습니다.";
			}
			dmseq = dietDao.check_dmseq();
			
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("url",  "/customer/DMDetail.do?dmseq="+dmseq);
			logger.info("########## recipe insert 종료 ##########");
			return "/common/redirect";
		}
		
		@RequestMapping(value = "/admin/insert_htform.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String htregisterForm(Model model, String msg, String err) {
			logger.info("########## Homet insert form 시작 ##########");
			logger.info(msg);
			logger.info(err);
			
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			logger.info("########## Homet insert form 종료 ##########");
			return "admin/admin_ht_register";
		}
		
		
		@RequestMapping(value = "/admin/register_ht.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String htregister(Model model, String msg, String err,HometVo htvo, @RequestParam("file1") MultipartFile file1) {
			logger.info("########## Homet register  시작 ##########");
			logger.info(msg);
			logger.info(err);
		
			
			int htseq = dietDao.check_htseq();
			String imgname1;
			String url1;
			if(htseq==0) {
				htseq=1;
				imgname1 = "ht"+htseq+"01";
			}else {
				htseq+=1;
				imgname1 = "ht"+htseq+("01");
			}
			
		
			if(!file1.isEmpty()) {
				url1 = fileUploadService.restore(file1,diet_prop.getProperty("filedir"), imgname1 );
				htvo.setImg(url1);;
			}
			
			
		
			int registerht =  dietDao.register_ht(htvo);
			
			if(registerht > 0) {
				msg = "등록 성공 하였습니다.";
			}else{
				msg = "등록 실패 하였습니다.";
			}
			
			 htseq = dietDao.check_htseq();
		/*	htseq =Integer.parseInt(htvo.getHtseq());
			*/
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("url",  "/customer/HTDetail.do?htseq="+htseq);
			logger.info("########## ht register 종료 ##########");
			return "/common/redirect";
		}
		
		@RequestMapping(value = "/admin/admin_htupform.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String htupForm(Model model, String msg, String err, @RequestParam("htseq") String htseq,HometVo hovo) {
			logger.info("########## customer htdetail 시작 ##########");
			logger.info(msg);
			logger.info(err);
		
			//String[] statelist = {"Hot", "New"};
			//String[] kindlist = {"요가", "댄스", "휘트니스"};
			//String[] htlevellist = {"상", "중", "하"};
			
			hovo.setHtseq(htseq);
			hovo = dietDao.gethtinform(hovo);
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("hovo", hovo);
			//model.addAttribute("statelist", statelist);
			//model.addAttribute("kindlist", kindlist);
			//model.addAttribute("htlevellist", htlevellist);
			logger.info("########## customer htdetail 종료 ##########");
			return "admin/admin_ht_update";
		}
		

		
		
		@RequestMapping(value = "/admin/update_ht.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String ht_update(Model model, String msg, String err,HometVo hovo, @RequestParam("file1") MultipartFile file1) {
			logger.info("########## Homet update >>>  시작 ##########");
			logger.info(msg);
			logger.info(err);
		
			
			int htseq = Integer.parseInt(hovo.getHtseq());
			String imgname1;
			String url1;
			imgname1 = "ht"+htseq+("01");
					
			if(!file1.isEmpty()) {
				url1 = fileUploadService.restore(file1,diet_prop.getProperty("filedir"), imgname1 );
				hovo.setImg(url1);;
			}
			
			
		
			int updateht =  dietDao.update_ht(hovo);
			
			if(updateht > 0) {
				msg = "등록 성공 하였습니다.";
			}else{
				msg = "등록 실패 하였습니다.";
			}
			
			htseq =Integer.parseInt(hovo.getHtseq());
			
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("url",  "/customer/HTDetail.do?htseq="+htseq);
			logger.info("########## ht update 종료 ##########");
			return "/common/redirect";
		}
		
		
		@RequestMapping(value = "/admin/admin_dmupform.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String dmupForm(Model model, String msg, String err, @RequestParam("dmseq") String dmseq,DietmenuVo dmvo) {
			logger.info("########## admin dm update form 시작 ##########");
			logger.info(msg);
			logger.info(err);
		
			
			
			dmvo.setDmseq(dmseq);
			dmvo = dietDao.getdminform(dmvo);
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("dmvo", dmvo);
		
			logger.info("########## admin dm update form 종료 ##########");
			return "admin/admin_dm_update";
		}
		
		
		@RequestMapping(value = "/admin/update_dm.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String dm_update(Model model, String msg, String err, DietmenuVo dmvo, @RequestParam("file1") MultipartFile file1
				, @RequestParam("file2") MultipartFile file2) {
			logger.info("########## Dietmenu update >>>  시작 ##########");
			logger.info(msg);
			logger.info(err);
		
			
			int dmseq = Integer.parseInt(dmvo.getDmseq());
			String imgname1, imgname2;
			String url1, url2;
			imgname1 = "dm"+dmseq+("01");
			imgname2 = "dm_"+dmseq+"02";
					
			if(!file1.isEmpty()) {
				url1 = fileUploadService.restore(file1,diet_prop.getProperty("filedir"), imgname1 );
				dmvo.setImg(url1);;
			}
			if(!file2.isEmpty()) {
				url2 = fileUploadService.restore(file2,diet_prop.getProperty("filedir"), imgname2 );
				dmvo.setDetail_img(url2);
			}
			
			
		
			int updatedm =  dietDao.update_dm(dmvo);
			
			if(updatedm > 0) {
				msg = "등록 성공 하였습니다.";
			}else{
				msg = "등록 실패 하였습니다.";
			}
			
			dmseq =Integer.parseInt(dmvo.getDmseq());
			
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("url",  "/customer/DMDetail.do?dmseq="+dmseq);
			logger.info("########## Dietmenus update 종료 ##########");
			return "/common/redirect";
		}
		
		@RequestMapping(value = "/admin/deltip_act.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String deltipeact(@RequestParam(value="delid", required=false) String[] nums, Model model, String msg, String err, HometVo hovo, DietmenuVo dmvo ) {
			logger.info("########## delete Diet tips act event 시작 ##########");
			int insertcnt = 0;
			int successcnt = 0;
			for(String title : nums) {
				logger.info(title);	
				StringTokenizer st = new StringTokenizer(title, "&");
			    String tipkind = st.nextToken();
			    logger.info(tipkind);
			    if( tipkind.equals("ht")) {
			    	insertcnt = dietDao.delete_httip(st.nextToken());
			    }else {
			    	insertcnt  = dietDao.delete_dmtip(st.nextToken());
			    }
				successcnt++;
			}
			
			
			if(insertcnt > 0) {
				msg = successcnt+ "건 삭제 성공 하였습니다.";
			}else{
				msg = "삭제 실패 하였습니다.";
			}
			
			
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("url", "/customer/DietTip.do");
			logger.info("########## delete  Diet tips act event 종료 ##########");
			return "/common/redirect";
			//return "redirect:/admin/adminpage.do";
		}
		
		
		
		
		@RequestMapping(value = "/customer/delcomment_act.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String delcusomer_cmtact(  Model model, String msg, String err, CommentsVo covo /*@RequestParam("nicknames") String nicknames */) {
			logger.info("########## delete customer comments act event 시작 ##########");
		
              			
				int delresult = dietDao.delete_comments(covo);
			 
			
			if(delresult > 0) {
				msg =  " 삭제 되었습니다.";
			}else{
				msg = "비밀번호가 틀렸습니다.";
			}
			
		    int fseq = covo.getFseq();
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("url", "/customer/FoodDetail.do?fseq="+fseq);
			logger.info("########## delete  calorie  act event 종료 ##########");
			return "/common/redirect";
			//return "redirect:/admin/adminpage.do";
		}
		
		
		@RequestMapping(value = "/customer/upcomment_act.do", method = {RequestMethod.GET,RequestMethod.POST})
		public String upcusomer_cmtact(  Model model, String msg, String err, CommentsVo covo /*@RequestParam("nicknames") String nicknames */) {
			logger.info("########## update customer comments act event 시작 ##########");
			
			
			int upresult = dietDao.update_comments(covo);
			
			
			if(upresult > 0) {
				msg =  " 코멘트 수정 완료 되었습니다.";
			}else{
				msg = "코멘트 수정 실패 되었습니다.";
			}
			
			int fseq = covo.getFseq();
			model.addAttribute("msg", msg);
			model.addAttribute("err", err);
			model.addAttribute("url", "/customer/FoodDetail.do?fseq="+fseq);
			logger.info("########## delete  calorie  act event 종료 ##########");
			return "/common/redirect";
			//return "redirect:/admin/adminpage.do";
		}
		
		
		
		
}
