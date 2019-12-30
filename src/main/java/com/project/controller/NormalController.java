package com.project.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NormalController {

    @Autowired
    private SqlSession sqlSession;


    @RequestMapping("normal_board_list")
    public String normal_board_list(){
        return "normal_board/normal_board";
    }

    @RequestMapping("normal_list_cont")
    public String normal_list_cont(){
        return "normal_board/normal_cont";
    }


}
