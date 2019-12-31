package com.project.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		q.setStartrow((page-1)*10+1);//시작행번호
		q.setEndrow(q.getStartrow()+limit-1);//끝행 번호
		
		List<QandAVO> qlist=this.QandAService.getQandAList(q);
		//검색 전후 목록
		
		//총페이지 수
		int maxpage=(int)((double)totalCount/limit+0.95);
		
		//시작페이지
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
	
	/* 게시판 내용보기 + 답변폼 + 수정폼 + 삭제폼 */
	@RequestMapping("/QandA/QandA_cont")
	public ModelAndView QandA_cont(
			int q_no,int page,
			String state,QandAVO q) {
		
		if(state.equals("cont")) {
			q=this.QandAService.getQandACont(q_no);
			//내용 보기 일 때만 조회수 증가
		}else {
			//답변,수정,삭제폼 => 조회수가 증가되지 않음
			q=this.QandAService.getBbsCont2(q_no);
		}
		
		String q_cont=q.getQ_cont();
		int q_ref=q.getQ_ref();
		ModelAndView cm=new ModelAndView();
		cm.addObject("q", q);
		cm.addObject("q_cont",q_cont);
		cm.addObject("page", page);
		cm.addObject("q_ref", q_ref);
		
		if(state.equals("cont")) {//내용보기
			cm.setViewName("/QandA/QandA_cont");
		}else if(state.equals("reply")) {//답변
			cm.setViewName("/QandA/QandA_reply");
		}else if(state.equals("edit")) {//수정
			cm.setViewName("/QandA/QandA_edit");
		}//if else if
		return cm;
	}//QandA_cont
	
	/* 답변저장 */
	@RequestMapping("/QandA_reply_ok")
	public String QandA_reply_ok(
			@ModelAttribute QandAVO q,
			@RequestParam("page") int page) {
		
		this.QandAService.replyQandA(q);
		//답변저장+답변 레벨 증가 => 트랜잭션 적용 대상
		
		return "redirect:/QandA/QandA_list?page="+page;
	}//QandA_reply_ok
	
	/* 게시판 글 수정 */
	@RequestMapping("/QandA_edit_ok")
	public ModelAndView QandA_edit_ok(
			HttpServletRequest request,
			QandAVO q) {
		
		int page=Integer.parseInt(request.getParameter("page"));
		int q_no=Integer.parseInt(request.getParameter("q_no"));
		String q_title=request.getParameter("q_title");
		String q_cont=request.getParameter("q_cont");
		
		q.setQ_no(q_no); q.setQ_title(q_title); q.setQ_cont(q_cont);
		
		this.QandAService.editQandA(q);//게시판 수정
		
		ModelAndView em=new ModelAndView("redirect:/QandA/QandA_cont");
		em.addObject("q_no", q_no);
		em.addObject("page", page);
		em.addObject("state", "cont");
		
		return em;				
	}//QandA_edit_ok
	
	/* 게시판 삭제 */
	@RequestMapping("/QandA_del_ok")
	public String Qand_del_ok(QandAVO q, int page,
			HttpServletRequest request) throws Exception {
		
		this.QandAService.delQandA(q.getQ_no());
		
		return "redirect:/QandA/QandA_list?page="+page;
	}
	
}
