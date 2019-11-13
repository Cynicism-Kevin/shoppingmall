package com.XiaomaCarl.shoppingmall.service;

import com.XiaomaCarl.shoppingmall.bean.User;
import com.XiaomaCarl.shoppingmall.dao.UserDao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


public interface UserService {
	
	public List<User> getUser(int id);
	
}
