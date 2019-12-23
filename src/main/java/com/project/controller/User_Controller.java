package com.project.controller;

import com.project.codesend.CodeSend;
import com.project.gmail.Gmail;
import com.project.service.UserService;
import com.project.vo.BoardVO;
import com.project.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;


@Controller
public class User_Controller {

    String code;

    @Autowired
    private UserService userService;

    //	임시시로 만들어둔 매핑주소

    //게시판
    @RequestMapping("board_list")
    public String board_list(){
        return "board/board_list";
    }

    //로그인
    @RequestMapping("login")
    public String login() {
        return "login/login";
    }

    //아이디찾기
    @RequestMapping("find_id")
    public String find_id() {
        return "find_id/find_id";
    }

    //비번찾기
    @RequestMapping("find_pwd")
    public String find_pwd() {
        return "find_pwd/find_pwd";
    }

    //로그아웃
    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    //게시판 목록
    @RequestMapping("back_end_list")
    public String back_end_list(Model listM, BoardVO b, HttpServletResponse response, HttpServletRequest request) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");//관리자 세션 아이디를 구함.
        if (user_id == null) {
            out.println("<script>");
            out.println("alert('다시로그인하세요!');");
            out.println("location='login';");
            out.println("</script>");
        } else {
            int page = 1;
            int limit = 7;//한페이지 보여지는 목록개수
            if (request.getParameter("page") != null) {
                //get으로 전달된 쪽번호가 있는경우 실행
                page = Integer.parseInt(request.getParameter("page"));
                //전달된 쪽번호를 정수 숫자로 치환
            }
            String back_end_field = request.getParameter("back_end_field");
            //검색어
            String back_end_title = request.getParameter("back_end_title");
            //검색필드

            b.setBack_end_title(back_end_title);
            b.setBack_end_field("%" + back_end_field + "%");//%는 오라클에서 하나 이상의 임의의 모르는 문자와 매핑대응

            int listcount = this.userService.getListCount();//검색전후 레코드 개수
            b.setStartrow((page - 1) * 7 + 1);//시작행번호
            b.setEndrow(b.getStartrow() + limit - 1);//끝행번호

            List<BoardVO> blist = this.userService.getUserBoardList(b);
            //관리자 게시판 검색전후 목록
            System.out.println(b.getStartrow() + "jghghfhfghfghfghfghfghfghfghfghfg");
            System.out.println(b.getEndrow());


            //총페이지
            int maxpage = (int) ((double) listcount / limit + 0.95);

            //시작 페이지
            int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

            //마지막 페이지
            int endpage = maxpage;
            if (endpage > startpage + 10 - 1)
                endpage = startpage + 10 - 1;
            listM.addAttribute("blist", blist);//blist키이름에 컬렉션 제네릭 blist저장
            listM.addAttribute("page", page);
            listM.addAttribute("startpage", startpage);
            listM.addAttribute("endpage", endpage);
            listM.addAttribute("maxpage", maxpage);
            listM.addAttribute("listcount", listcount);
            listM.addAttribute("search_name", back_end_field);
            listM.addAttribute("search_Field", back_end_title);

            return "html/back_end_list";
        }
        return null;
    }

    //로그인 확인
    @RequestMapping("login_ok")
    public String login_ok(MemberVO m, HttpSession session, HttpServletResponse response)throws Exception{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //System.out.println("아이디값"+m.getUser_id());
        MemberVO mem = this.userService.select_id_pwd(m);

        if(mem==null) {
            out.println("<script>");
            out.println("alert('해당 정보를 찾지못하였습니다')");
            out.println("location='login';");
            out.println("</script>");
        }else{
            String user_id=mem.getUser_id();
            session.setAttribute("user_id",user_id);
            return "redirect:/back_end_list";
        }
        return null;
    }

    //전화번호 및 코드 발송
    @RequestMapping("codesend")
    public String codesend(String user_phone,HttpServletResponse response,Model m)throws Exception {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        MemberVO phonecode = this.userService.phone_check(user_phone);
        String codenum="";
        if (phonecode != null) {
            codenum = new CodeSend().cd1();
            System.out.println(codenum);
            System.out.println(user_phone);
            //CodeMessage.sms_send(phone,codenum);

            out.print(codenum);
        }
        return null;
    }


    //아이디 찾기
    @RequestMapping("find_id_check")
    public String find_id_check(String user_name,String phone,MemberVO m,HttpServletResponse response)throws Exception{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        System.out.println("이름"+user_name);
        System.out.println("번호"+phone);
        m.setUser_name(user_name);
        m.setUser_phone(phone);
        MemberVO uv = this.userService.select_name_phone(m);


        if(uv != null){
            System.out.println("이메일 발송");
            Gmail.gmailSendID(uv.getUser_name(),uv.getUser_email(),uv.getUser_id());
            out.println("<script>");
            out.println("alert('이메일 발송 완료!');");
            out.println("location='login';");
            out.println("</script>");

        }else{
            out.println("<script>");
            out.println("alert('정보가 없습니다 다시입력해주세요!')");
            out.println("history.back();");
            out.println("</script>");
        }
        return null;
    }

    //비밀번호찾기
    @RequestMapping("find_pwd_check")
    public String find_pwd_check(String user_id,String user_name,String phone,MemberVO m,HttpServletResponse response)throws Exception{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        System.out.println("아이디"+user_id);
        System.out.println("이름"+user_name);
        System.out.println("폰"+phone);
        m.setUser_id(user_id);
        m.setUser_name(user_name);
        m.setUser_phone(phone);
        MemberVO uv = this.userService.select_id_name_phone(m);
        int re=-1;
        if(uv != null){
            uv.setUser_pwd(new CodeSend().cd1());
            System.out.println("임시비번"+uv.getUser_pwd());
            re=this.userService.pwdUPdate(uv);

            if(re==1) {
                System.out.println("이메일 발송");
                Gmail.gmailSendPWD(uv.getUser_name(), uv.getUser_email(), uv.getUser_pwd());
                out.println("<script>");
                out.println("alert('이메일 발송 완료!');");
                out.println("location='login';");
                out.println("</script>");
            }

        }else{
            out.println("<script>");
            out.println("alert('정보가 없습니다 다시입력해주세요!')");
            out.println("history.back();");
            out.println("</script>");
        }
        return null;
    }


    //내용보기
    @RequestMapping("cont")
    public String cont(String id,String title,String cont,String date,HttpServletResponse response,Model mav){
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("아이디"+id);
        System.out.println("제목"+title);
        System.out.println("내용"+cont);
        System.out.println("날짜"+date);

        mav.addAttribute("id",id);
        mav.addAttribute("title",title);
        mav.addAttribute("cont",cont);
        mav.addAttribute("date",date);

        return "html/board_cont";
    }
}
