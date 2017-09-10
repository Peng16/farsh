package org.ssm.farsh.model;

import java.io.Serializable;
import java.util.Date;

public class Product implements Serializable{

	private Integer pId;
	private String pname;
	private Double price;
	private String picture;
	private Integer psalenum;
	private Integer pstock;
	private Double pdiscount;
	private String pattern;
	private Date pubdate;
	private String pcategory;
	
	private Address address;
	
	public Product(){} 
	
	public Product(Integer pId){
		this.pId=pId;
	}
	
	public Product(Integer pId,String pname,Double price,String picture,Integer psalenum,Integer pstock,Double pdiscount,String pattern,Date pubdate,String pcategory){
		this.pId=pId;
		this.pname=pname;
		this.price=price;
		this.picture=picture;
		this.psalenum=psalenum;
		this.pstock=pstock;
		this.pdiscount=pdiscount;
		this.pattern=pattern;
		this.pubdate=pubdate;
		this.pcategory=pcategory;
	}
	
	public Product(String pname,Double price,String picture,Integer psalenum,Integer pstock,Double pdiscount,String pattern,Date pubdate,String pcategory){
		this.pname=pname;
		this.price=price;
		this.picture=picture;
		this.psalenum=psalenum;
		this.pstock=pstock;
		this.pdiscount=pdiscount;
		this.pattern=pattern;
		this.pubdate=pubdate;
		this.pcategory=pcategory;
	}
	
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Integer getPsalenum() {
		return psalenum;
	}
	public void setPsalenum(Integer psalenum) {
		this.psalenum = psalenum;
	}
	public Integer getPstock() {
		return pstock;
	}
	public void setPstock(Integer pstock) {
		this.pstock = pstock;
	}
	public Double getPdiscount() {
		return pdiscount;
	}
	public void setPdiscount(Double pdiscount) {
		this.pdiscount = pdiscount;
	}
	public String getPattern() {
		return pattern;
	}
	public void setPattern(String pattern) {
		this.pattern = pattern;
	}
	public Date getPubdate() {
		return pubdate;
	}
	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}
	 
	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pname=" + pname + ", price=" + price
				+ ", picture=" + picture + ", psalenum=" + psalenum
				+ ", pstock=" + pstock + ", pdiscount=" + pdiscount
				+ ", pattern=" + pattern + ", pubdate=" + pubdate
				+ ", pcategory=" + pcategory + "]";
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}
	
	
}
