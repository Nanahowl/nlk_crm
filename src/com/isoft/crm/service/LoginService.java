package com.isoft.crm.service;

import java.util.List;
import java.util.Set;

import com.isoft.crm.bean.MenuBean;
import com.isoft.crm.bean.UserSession;
/**
 * 
 *@Title: LoginService.java
 *@Package: com.isoft.crm.service
 *@Description:
 *		the Login factory interface.
 *@author: Nina Zhao
 *@date:下午11:13:19
 */

public interface LoginService {
	//Finding the user info depending on loginName, password.
	public UserSession getUserSession(String loginName, String upwd);
	
	//Getting the menu and authority
	public List<MenuBean> getMenu(UserSession userSession);
	
	//Changing the pasword
	public void updatePwd(UserSession userSession, String newPwd);
	
	//Getting user's authority id.
	public Set<Integer> getFunctionIdByRoleId(Integer roleId);
}
