package org.ssm.farsh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.ssm.farsh.model.Record;

public interface RecordDao {

	//添加记录到Record
	public void saveRecord(Record record);
	//通过uid和sid 查询
	public Record searchByUidAndSid(@Param(value="uid")Integer uid,@Param(value="sid")Integer sid);
	//通过rid 查询
	public Record queryRecordByrid(Integer rid);
	//通过 uid查询
	public List<Record> queryRecordByuid(Integer uid);
	//通过rid删除
	public void deletebyrid(Integer rid);
	//查询所有record信息
	public List<Record> queryAllRecords();
	
}
