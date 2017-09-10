package org.ssm.farsh.model;

import java.io.Serializable;

public class Record implements Serializable{

	private Integer reId;
	private Integer pId;
	private Integer pNum;
	private String rPicture;
	private Double rprice;
	private Double pDiscount;
	private Double pSumprice;
	private Integer uid;
	private Integer sid;
	
	public Record(){}
	
	public Record(Integer pId,Integer pNum,String rPicture,Double rprice,Double pDiscount,Double pSumprice,Integer uid,Integer sid){
		this.pId=pId;
		this.pNum=pNum;
		this.rPicture=rPicture;
		this.rprice=rprice;
		this.pDiscount=pDiscount;
		this.pSumprice=pSumprice;
		this.uid=uid;
		this.sid=sid;
	}
	
	@Override
	public String toString() {
		return "Record [reId=" + reId + ", pId=" + pId + ", pNum=" + pNum
				+ ", rPicture=" + rPicture + ", rprice=" + rprice
				+ ", pDiscount=" + pDiscount + ", pSumprice=" + pSumprice
				+ ", uid=" + uid + ", sid=" + sid + "]";
	}

	public Integer getReId() {
		return reId;
	}
	public void setReId(Integer reId) {
		this.reId = reId;
	}
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	public Double getpDiscount() {
		return pDiscount;
	}
	public void setpDiscount(Double pDiscount) {
		this.pDiscount = pDiscount;
	}
	public Double getpSumprice() {
		return pSumprice;
	}
	public void setpSumprice(Double pSumprice) {
		this.pSumprice = pSumprice;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getrPicture() {
		return rPicture;
	}

	public void setrPicture(String rPicture) {
		this.rPicture = rPicture;
	}

	public Double getRprice() {
		return rprice;
	}

	public void setRprice(Double rprice) {
		this.rprice = rprice;
	}
	 
	
	
}
