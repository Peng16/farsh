package org.ssm.farsh.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class Order implements Serializable{

	private Integer oId;
	private Integer rid;
	private String onum;
	private Integer aid;
	private Integer uid;
	private Integer ostate;
	private Date oDate;
	private Double oSumprice;
	
	private List<Record> records;
	
	public Order(){}
	
	public Order(Integer oid){
		this.oId=oid;
	}
	
	public Order(Integer rid,Integer uid,Integer ostate,Double oSumprice){
		this.rid=rid;
		this.uid=uid;
		this.ostate=ostate;
		this.oSumprice=oSumprice;
	}
	
	 
 

	@Override
	public String toString() {
		return "Order [oId=" + oId + ", rid=" + rid + ", onum=" + onum
				+ ", aid=" + aid + ", uid=" + uid + ", ostate=" + ostate
				+ ", oDate=" + oDate + ", oSumprice=" + oSumprice +", record=" + records+ "]";
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}


	public Integer getoId() {
		return oId;
	}

	public void setoId(Integer oId) {
		this.oId = oId;
	}

 

	public List<Record> getRecords() {
		return records;
	}

	public void setRecords(List<Record> records) {
		this.records = records;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getOstate() {
		return ostate;
	}

	public void setOstate(Integer ostate) {
		this.ostate = ostate;
	}

	 
	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public Double getoSumprice() {
		return oSumprice;
	}

	public void setoSumprice(Double oSumprice) {
		this.oSumprice = oSumprice;
	}

	public String getOnum() {
		return onum;
	}

	public void setOnum(String onum) {
		this.onum = onum;
	}

	
	
}
