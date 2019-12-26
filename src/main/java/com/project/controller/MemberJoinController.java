package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.MemberJoinService;
import com.project.vo.MemberVO;

@Controller
public class MemberJoinController {
	
	@Autowired
	private MemberJoinService memberJoinService;
	

	@RequestMapping("/memberjoin")
	public String MemberJoin() {
		
		return "MemberJoin/MemberJoin";
	}
	
	@RequestMapping("/memberjoin_ok")
	public String MemberJoin_ok(MemberVO mb, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String user_birthdayYY = request.getParameter("user_birthdayYY");
		String user_birthdayMM = request.getParameter("user_birthdayMM");
		String user_birthdayDD = request.getParameter("user_birthdayDD");
		
		String user_birthday = user_birthdayYY +"년 "+ user_birthdayMM +"월 "+ user_birthdayDD + "일";
		mb.setUser_birthday(user_birthday);
		
		if(!mb.equals(" ")) {
			System.out.println(mb.getUser_id());			
			memberJoinService.insert(mb);
			
			return "MemberJoin/MemberJoin";
		}else {
			System.out.println("else문 실행");
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
            out.flush();
		}
		
		
		return null;		
	}

}
