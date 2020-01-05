package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.service.CompanyService;
import com.project.vo.CompanyVO;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyService companyService;
	
	@RequestMapping("/Company")
	public ModelAndView MapTest(ModelAndView mav) {
		List Company_names = companyService.selectCompany_name();
		mav.setViewName("CompanyMap/CompanyMap");
		mav.addObject("company_names", Company_names);
		return mav;		
	}

	//지점 추가 multipart 라서 multipart request로 응답받아야 값을 가져올 수 있다.
	@RequestMapping("/newCompany")
	public String newCompany(CompanyVO companyVO,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		//image값 안들어왔을 경우 기본이미지 경로로 초기화
		if(companyVO.getCompany_image().equals("")) {
			companyVO.setCompany_image("기본 이미지");
			System.out.println(companyVO.getCompany_image());
		}
		//input값에 빈공백이 들어왔을경우
		if(companyVO.getCompany_name().equals("") || companyVO.getCompany_x().equals("") || companyVO.getCompany_y().equals("")
				|| companyVO.getCompany_addr().equals("")) {
			out.println("<script> alert('정보를 다시 확인해 주세요'); history.back(); </script>");
			
		}else {
			//정상적으로 값이 들어오면 db에 저장
			companyService.insertCompany(companyVO);
			out.println("<script> alert('지점 등록 성공'); location='/Company'; </script>");			
		}
		return null;
	}
	
	//AJAX로 지점 정보 값 return
	@RequestMapping("/MapOverlay")
	@ResponseBody
	public CompanyVO MapOverlay(CompanyVO companyVO) {
		System.out.println(companyVO.getCompany_name());
		companyVO = companyService.selectCompany_info(companyVO);
		System.out.println("반환 name = "+ companyVO.getCompany_name());
		System.out.println("반환 no = "+ companyVO.getCompany_no());
		System.out.println("반환 image = "+ companyVO.getCompany_image());
		System.out.println("반환 addr = "+ companyVO.getCompany_addr());
		return companyVO;
	}
}
