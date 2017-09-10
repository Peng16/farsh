package org.ssm.farsh.model;

import java.io.Serializable;
import java.util.Date;

public class Scart implements Serializable{

	private Integer sId;
	private Integer amount;
	private Integer uid;
	private Integer pid;
	private Double sprice;
	private String spicture;
	private String sname;
	private Date sdate;
	private Double sumprice;
	
	public Scart(){}
	
	public Scart(Integer sId){
		this.sId=sId;
	}
	
	public Scart(Integer amount,Double sumprice){
		this.amount=amount;
		this.sumprice=sumprice;
	}
	
	public Scart(Integer amount,Integer uid,Integer pid,Double sprice,String spicture,String sname,Date sdate,Double sumprice){
		this.amount=amount;
		this.uid=uid;
		this.pid=pid;
		this.sprice=sprice;
		this.spicture=spicture;
		this.sname=sname;
		this.sdate=sdate;
		this.sumprice=sumprice;
	}
	public Scart(Integer sid,Integer amount,Integer uid,Integer pid,Double sprice,String spicture,String sname,Date sdate,Double sumprice){
		this.sId=sid;
		this.amount=amount;
		this.uid=uid;
		this.pid=pid;
		this.sprice=sprice;
		this.spicture=spicture;
		this.sname=sname;
		this.sdate=sdate;
		this.sumprice=sumprice;
	}

	public Integer getsId() {
		return sId;
	}

	public void setsId(Integer sId) {
		this.sId = sId;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Double getSprice() {
		return sprice;
	}

	public void setSprice(Double sprice) {
		this.sprice = sprice;
	}

	public String getSpicture() {
		return spicture;
	}

	public void setSpicture(String spicture) {
		this.spicture = spicture;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	 
	public Double getSumprice() {
		return sumprice;
	}

	public void setSumprice(Double sumprice) {
		this.sumprice = sumprice;
	}

	@Override
	public String toString() {
		return "Scart [sId=" + sId + ", amount=" + amount + ", uid=" + uid
				+ ", pid=" + pid + ", sprice=" + sprice + ", spicture="
				+ spicture + ", sname=" + sname + ", sdate=" + sdate
				+ ", sumprice=" + sumprice + "]";
	}
	
	
}
