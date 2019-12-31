package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.QandAService;
import com.project.vo.QandAVO;

@Controller
public class QandAController {//Q&A게시판
	
	@Autowired
	private QandAService QandAService;
	
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
	
	/* QandA 게시판 저장 */
	@RequestMapping("/QandA_write_ok")
	public String QandA_write_ok(
			QandAVO q,
			HttpServletRequest request) throws Exception {
		
		String q_title=request.getParameter("q_title");
		String q_cont=request.getParameter("q_cont");
		//제목, 내용을 가져옴
		
		q.setQ_title(q_title); q.setQ_cont(q_cont);
		
		this.QandAService.insertQandA(q);//자료실 저장
		
		return "redirect:/QandA/QandA_list?page=1";
	}//QandA_write_ok
	
	/* QandA 게시판 목록 */
	@RequestMapping("/QandA/QandA_list")
	public String QandA_list(
			Model listM,QandAVO q,
			HttpServletRequest request) {
		
		int page=1;
		int limit=10;
		
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		String find_name = request.getParameter("find_name");
		String find_field = request.getParameter("find_field");
		//검색어, 검색필드 저장
		
		q.setFind_field(find_field);
		q.setFind_name("%"+find_name+"%");
		
		int totalCount=this.QandAService.getListCount(q);
		//검색전후 레코드 개수
		q.setStartrow((page-1)*10-1);//시작행 번호
		q.setEndrow(q.getStartrow()+limit-1);//끝행번호
		
		List<QandAVO> qlist=this.QandAService.getQandAList(q);
		//검색 전후 목록
		
		//총페이지 수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작 페이지
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//마지막 페이지
		int endpage=maxpage;
		
		if(endpage>startpage+10-1)
			endpage=startpage+10-1;
		
		listM.addAttribute("qlist",qlist);
		listM.addAttribute("page",page);
		listM.addAttribute("startpage",startpage);
		listM.addAttribute("endpage",endpage);
		listM.addAttribute("maxpage",maxpage);
		listM.addAttribute("totalcount",totalCount);
		listM.addAttribute("find_field",find_field);
		listM.addAttribute("find_name",find_name);
		
		return "QandA/QandA_list";
	}//QandA_list
	
	
}
