package org.ssm.farsh.model;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer uid;
    private String account;
    private String pwd;
    private String name;
    private String sex;
    private Integer age;
	private  Date birthday;
	private String phone;
	private String email;
	private String upicFilename;
    private float umoney;
    private String uType;
    private String uauthority;
    
	public User(){}
	public User(Integer uid){
		this.uid=uid;
	}
	public User(String account,String pwd,String name,String sex,Integer age,String upicFilename){
		this.account=account;
		this.pwd=pwd;
		this.name=name;
		this.sex=sex;
		this.age=age;
		this.upicFilename=upicFilename;
	}
	public User(String account,String pwd,String uType,String uauthority){
		this.account=account;
		this.pwd=pwd;
		this.uType=uType;
		this.uauthority=uauthority;
	}
	public User(String upicFilename){
		this.upicFilename=upicFilename;
	}
	public User(Integer uid,String account,String pwd,String name,String sex){
		this.uid=uid;
		this.account=account;
		this.pwd=pwd;
		this.name=name;
		this.sex=sex;
	}
	public User(String account,String pwd){
		this.account=account;
		this.pwd=pwd;
	}
	public User(float umoney){
		this.umoney=umoney;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUpicFilename() {
		return upicFilename;
	}
	public void setUpicFilename(String upicFilename) {
		this.upicFilename = upicFilename;
	}
	public float getUmoney() {
		return umoney;
	}
	public void setUmoney(float umoney) {
		this.umoney = umoney;
	}
	public String getuType() {
		return uType;
	}
	public void setuType(String uType) {
		this.uType = uType;
	}
	public String getUauthority() {
		return uauthority;
	}
	public void setUauthority(String uauthority) {
		this.uauthority = uauthority;
	}
	 
	
}
