package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QandAController {//Q&A게시판
	
	/*@Autowired
	private QandAService QandAservice;*/
	
	/* 질문 게시판 글쓰기*/
	@RequestMapping("/QandA/QandA_write")
	public String QandA_write(
			HttpServletRequest request, Model m){
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page", page);
		
		return "QandA/QandA_write";
	}//QandA_write
	
	
}
