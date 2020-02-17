package com.ateam.solohomes.beans.manager;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface ManagerDAO {

	// REST
	// select all users
	public ArrayList<MemberRenumDTO> selectAllUserByRow(@Param("startRow") int startRow, @Param("listPage") int listPage);
	public ArrayList<MemberRenumDTO> selectAllUserByRowReportedNum(@Param("startRow") int startRow, @Param("listPage") int listPage);
	public ArrayList<MemberRenumDTO> selectAllUserByRowRegdate(@Param("startRow") int startRow, @Param("listPage") int listPage);
	public ArrayList<MemberRenumDTO> selectAllUserByRowId(@Param("startRow") int startRow, @Param("listPage") int listPage);
	public ArrayList<MemberRenumDTO> selectAllUserByRowNN(@Param("startRow") int startRow, @Param("listPage") int listPage);
	// select all admins
	public ArrayList<MemberRenumDTO> selectAllAdminByRow(@Param("startRow") int startRow, @Param("listPage") int listPage);
	
	// delete cehecked members
	public int deleteMembersByUid(@Param("uidList") int[] list);
}
