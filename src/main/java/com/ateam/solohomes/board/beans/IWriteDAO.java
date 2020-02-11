package com.ateam.solohomes.board.beans;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IWriteDAO {
	public ArrayList<BWriteDTO> select();
	
	public int insert(final BWriteDTO dto);
	//오버로딩
	public int insert(String subject, String content, String name);
	
	//public ArrayList<BWriteDTO> readByUid(int uid);
	public ArrayList<BWriteDTO> readByUid(int uid);
	public int incViewCnt(int uid);
	
	public ArrayList<BWriteDTO> selectByUid(int uid);
	//public int update(final BWriteDTO dto);
	public int update(int uid, @Param("a") final BWriteDTO dto);
	public int delete(int uid);
	
	public BWriteDTO searchBySubject(String subject);
}


