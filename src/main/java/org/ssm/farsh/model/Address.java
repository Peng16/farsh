package org.ssm.farsh.model;

import java.io.Serializable;

public class Address implements Serializable{
	private Integer aId;
	private String aName;
	private String aPhone;
	private String aProvince;
	private String aCity;
	private String aDetailed;
	private Integer uid;
	private Integer aDefult;
	private Address address;
	public Address(){}
	
	public Address(Integer aId){
		this.aId=aId;
	}

	public Address(String aName,String aPhone,String aProvince,String aCity,String aDetailed,Integer uid,Integer aDefult){
		this.aName = aName;
		this.aPhone=aPhone;
		this.aProvince=aProvince;
		this.aCity=aCity;
		this.aDetailed=aDetailed;
		this.uid=uid;
		this.aDefult=aDefult;
	}

	public Integer getaId() {
		return aId;
	}

	public void setaId(Integer aId) {
		this.aId = aId;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaPhone() {
		return aPhone;
	}

	public void setaPhone(String aPhone) {
		this.aPhone = aPhone;
	}

	public String getaProvince() {
		return aProvince;
	}

	public void setaProvince(String aProvince) {
		this.aProvince = aProvince;
	}

	public String getaCity() {
		return aCity;
	}

	public void setaCity(String aCity) {
		this.aCity = aCity;
	}

	public String getaDetailed() {
		return aDetailed;
	}

	public void setaDetailed(String aDetailed) {
		this.aDetailed = aDetailed;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getaDefult() {
		return aDefult;
	}

	public void setaDefult(Integer aDefult) {
		this.aDefult = aDefult;
	}

	@Override
	public String toString() {
		return "Address [aId=" + aId + ", aName=" + aName + ", aPhone="
				+ aPhone + ", aProvince=" + aProvince + ", aCity=" + aCity
				+ ", aDetailed=" + aDetailed + ", uid=" + uid + ", aDefult="
				+ aDefult + "]";
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	 
 
	
	
}
