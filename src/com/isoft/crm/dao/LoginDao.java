package com.isoft.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.isoft.crm.bean.MenuBean;
import com.isoft.crm.bean.UserSession;

/**
 * 
 *@Title: LoginDao.java
 *@Package: com.isoft.crm.dao
 *@Description:
 *		Communicating with MySQL database.
 *		Using Mybatis to simplify the codes.
 *@author: Nina Zhao
 *@date:下午11:36:45
 */

public interface LoginDao {
	//Getting the username and pwd from the UserSession
	public UserSession getUserSession(
			@Param("loginName")String loginName,
			@Param("upwd")String upwd);
	
	//Getting the root menus
	public List<MenuBean> findParentMenuModelByRoleId
						  (@Param("roleId")Integer roleId);
	
	//Getting the sub menus
	public List<MenuBean> findChildMenuRoleIdAndMenuId
						 (@Param("roleId")Integer roleId,
						  @Param("functionId")Integer functionId);
	
	//Changing the password
	@Update("UPDATE comp_user SET login_pwd=#{newPwd}"
			+ "WHERE login_name=#{loginName}")
	public void updatePwdByLoginName(
									@Param("loginName")String loginName,
									@Param("newPwd")String newPwd);
	
	//Getting all of the authorities
	public List<Integer> getFunctionIdsByRoleId(
									@Param("roleId")Integer roleId);
}
