package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	@RequestMapping("/MyPage/MyPage_user")
	public String MyPage() {
		
		return "MyPage/MyPage_user";
	}
}
