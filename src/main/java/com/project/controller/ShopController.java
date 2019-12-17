package com.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.service.ShopService;
import com.project.vo.ShopVO;

@Controller
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	/** shop 리스트로 이동 **/
	@RequestMapping("shop/total_shop")
	public ModelAndView shop_list() {
		
		return new ModelAndView("shop/shop_list");
	}//shop_list()
	
	
	/** shop 관리자 글쓰기 **/
	@RequestMapping("shop/shop_write")
	public ModelAndView shop_write() {
		
		return new ModelAndView("shop/shop_write");
	}//shop_write()
	
	/** 다중 파일 업로드 **/
	@RequestMapping("/multiplePhotoUpload")
	public void multiplePhotoUpload(
			HttpServletRequest request,
			HttpServletResponse response) {
		
		try {
	         //파일정보
	         String sFileInfo = "";
	         
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
	         File file = new File(filePath);
	        
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         
	         ///////////////// 서버에 파일쓰기 /////////////////
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         
	         ///////////////// 서버에 파일쓰기 /////////////////
	         
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/resources/photo_upload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	         
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
	}//multiplePhotoUpload()
	
	
	/** shop 상품 게시글 저장 **/
	@RequestMapping("shop_write_ok")
	public ModelAndView shop_write_ok(
			ShopVO s) {
		
		this.shopService.insert(s);
		system.out.println("에디터 컨텐츠값: "+s.getItem_()());
		
	}//shop_write_ok()
	
}

















