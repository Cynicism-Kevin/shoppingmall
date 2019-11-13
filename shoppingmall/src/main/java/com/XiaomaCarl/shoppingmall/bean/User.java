package com.XiaomaCarl.shoppingmall.bean;

import org.springframework.stereotype.Component;

public class User {
    //用户id
    private int uid;
    //用户名
    private String uname;
    //密码
    private String password;
    //手机号
    private String phone;
    //送货地址
    private String address;
    //积分
    private int upoint;
    //前台登陆： 1 是正常登陆， 0 为禁止登陆
    private int allow_1;
    //订单管理： 1 可以登陆后台，对订单进行管理， 0 为无此权限
    private int allow_2;
    //录入数据： 1 可以登陆后台，可以对数据做增改查， 0 为此无权限
    private int allow_3;
    //超级管理员： 1 可以删除数据，可以对有管理员权限的用户进行管理， 0 为无此权限
    private int allow_4;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getUpoint() {
        return upoint;
    }

    public void setUpoint(int upoint) {
        this.upoint = upoint;
    }

    public int getAllow_1() {
        return allow_1;
    }

    public void setAllow_1(int allow_1) {
        this.allow_1 = allow_1;
    }

    public int getAllow_2() {
        return allow_2;
    }

    public void setAllow_2(int allow_2) {
        this.allow_2 = allow_2;
    }

    public int getAllow_3() {
        return allow_3;
    }

    public void setAllow_3(int allow_3) {
        this.allow_3 = allow_3;
    }

    public int getAllow_4() {
        return allow_4;
    }

    public void setAllow_4(int allow_4) {
        this.allow_4 = allow_4;
    }
}
