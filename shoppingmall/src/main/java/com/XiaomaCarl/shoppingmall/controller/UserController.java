package com.XiaomaCarl.shoppingmall.controller;

import com.XiaomaCarl.shoppingmall.bean.User;
import com.XiaomaCarl.shoppingmall.dao.UserDao;
import com.XiaomaCarl.shoppingmall.service.UserService;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource
    private UserDao userDao;

    @RequestMapping(value = "/login")
    public String login(HttpSession session, Model model) {
    	User user = userDao.findByUsername("root");
    	model.addAttribute("user",user);
    	return "user";
        
    }

}
