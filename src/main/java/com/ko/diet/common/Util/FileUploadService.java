package com.ko.diet.common.Util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sun.media.jfxmedia.logging.Logger;

@Service
public class FileUploadService {
	
	// 프로퍼티 객체 주입
	/*
	@Resource(name = "diet_prop")
	private static Properties diet_prop;
	*/
	// 리눅스 기준으로 파일 경로를 작성 ( 루트 경로인 /으로 시작한다. )
	// 윈도우라면 workspace의 드라이브를 파악하여 JVM이 알아서 처리해준다.
	// 따라서 workspace가 C드라이브에 있다면 C드라이브에 upload 폴더를 생성해 놓아야 한다.
//	private static final String SAVE_PATH = "C:/Users/user/git/oneulbuter/src/main/webapp/include/uploadimg";
	//private static final String SAVE_PATH = diet_prop.getProperty("filedir");
	private static final String PREFIX_URL = "/include/uploadimg/";
	
	public String restore(MultipartFile multipartFile, String filedir, String imgname) {
		String url = null;
		
		try {
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName(imgname);
			
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			
		
			
			System.out.println("확장자명 확인 >>>>>>"+extName);
			writeFile(multipartFile, saveFileName+extName.toLowerCase(),filedir);
			url = PREFIX_URL +  saveFileName+extName.toLowerCase();
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			throw new RuntimeException(e);
		}
		return url;
	}
	
	
	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";
		

		fileName += extName;
		
		return fileName;
	}
	
	
	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(MultipartFile multipartFile, String saveFileName, String filedir)
								throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(filedir + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}
}