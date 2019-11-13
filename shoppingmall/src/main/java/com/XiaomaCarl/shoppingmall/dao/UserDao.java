package com.XiaomaCarl.shoppingmall.dao;

import org.springframework.stereotype.Repository;

import com.XiaomaCarl.shoppingmall.bean.User;

import java.util.List;

public interface UserDao {
	
	User findByUsername(String username);
	
}