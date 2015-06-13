package com.jb.pojo;

import java.text.MessageFormat;
import java.util.HashSet;
import java.util.Set;


/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User  implements java.io.Serializable {


    // Fields    

     private Integer uid;						//用户id
     private Level level;						//用户级别
     private String uname;					//用户名
     private String pwd;
     private String email;
     private String headImg;
     private String regTime;
     private String regIp;
     private String phone;
     private Double money = 0.00;			//帐户余额
     private String admin="否";
     private String service="否";
     private Set accountses = new HashSet(0);
     private Set addresses = new HashSet(0);
     private Set carts = new HashSet(0);
     private Set discusses = new HashSet(0);
     private Set orders = new HashSet(0);
     private Set newses = new HashSet(0);


    // Constructors

    /** default constructor */
    public User() {
    }

    
    /** full constructor */
    public User(Level level, String uname, String pwd, String email, String headImg, String regTime, String regIp, String phone, Double money, String admin, String service, Set accountses, Set addresses, Set carts, Set discusses, Set orders, Set newses) {
        this.level = level;
        this.uname = uname;
        this.pwd = pwd;
        this.email = email;
        this.headImg = headImg;
        this.regTime = regTime;
        this.regIp = regIp;
        this.phone = phone;
        this.money = money;
        this.admin = admin;
        this.service = service;
        this.accountses = accountses;
        this.addresses = addresses;
        this.carts = carts;
        this.discusses = discusses;
        this.orders = orders;
        this.newses = newses;
    }

   
    // Property accessors

    public Integer getUid() {
        return this.uid;
    }
    
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Level getLevel() {
        return this.level;
    }
    
    public void setLevel(Level level) {
        this.level = level;
    }

    public String getUname() {
        return this.uname;
    }
    
    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPwd() {
        return this.pwd;
    }
    
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public String getHeadImg() {
        return this.headImg;
    }
    
    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }

    public String getRegTime() {
        return this.regTime;
    }
    
    public void setRegTime(String regTime) {
        this.regTime = regTime;
    }

    public String getRegIp() {
        return this.regIp;
    }
    
    public void setRegIp(String regIp) {
        this.regIp = regIp;
    }

    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Double getMoney() {
        return this.money;
    }
    
    public void setMoney(Double money) {
        this.money = money;
    }

    public String getAdmin() {
        return this.admin;
    }
    
    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public String getService() {
        return this.service;
    }
    
    public void setService(String service) {
        this.service = service;
    }

    public Set getAccountses() {
        return this.accountses;
    }
    
    public void setAccountses(Set accountses) {
        this.accountses = accountses;
    }

    public Set getAddresses() {
        return this.addresses;
    }
    
    public void setAddresses(Set addresses) {
        this.addresses = addresses;
    }

    public Set getCarts() {
        return this.carts;
    }
    
    public void setCarts(Set carts) {
        this.carts = carts;
    }

    public Set getDiscusses() {
        return this.discusses;
    }
    
    public void setDiscusses(Set discusses) {
        this.discusses = discusses;
    }

    public Set getOrders() {
        return this.orders;
    }
    
    public void setOrders(Set orders) {
        this.orders = orders;
    }

    public Set getNewses() {
        return this.newses;
    }
    
    public void setNewses(Set newses) {
        this.newses = newses;
    }
   
    @Override
    public String toString() {
    	return MessageFormat.format("id:{0}\t姓名:{1}\t密码:{2}\t邮箱:{3}\t手机号:{4}\n头像:{5}", this.uid,this.uname,this.pwd,this.email,this.phone,this.headImg);
    }

    @Override
    public boolean equals(Object obj) {
    	User u = (User) obj;
    	if(u.getUid()==this.uid){
    		return true;
    	}else{
    		return false;
    	}
    }





}