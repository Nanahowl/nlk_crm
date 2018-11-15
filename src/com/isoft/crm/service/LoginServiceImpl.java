package com.isoft.crm.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.isoft.crm.bean.MenuBean;
import com.isoft.crm.bean.UserSession;
import com.isoft.crm.dao.LoginDao;
import com.isoft.crm.util.MD5Utils;

/**
 * 
 *@Title: LoginServiceImpl.java
 *@Package: com.isoft.crm.service
 *@Description:
 *			Implement the 4 functions.
 *@author: Nina Zhao
 *@date:下午11:24:03
 */

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	@Resource
	private LoginDao dao; 
	
	@Override
	public UserSession getUserSession(String loginName, String upwd) {
		if(loginName!=null&&upwd!=null) {
			String passwordMd5 = MD5Utils.getMD5Str(upwd);
			System.out.println("pwd:"+passwordMd5);
			return dao.getUserSession(loginName, passwordMd5);
		}
		return null;
	}

	@Override
	//Getting the menus of the login user
	public List<MenuBean> getMenu(UserSession userSession) {
		List<MenuBean> menus = dao.findParentMenuModelByRoleId(userSession.getRoleId());
		System.out.println("menus::::::"+menus);
		for(int i=0;i<menus.size();i++) {
			MenuBean menu = menus.get(i);
			List<MenuBean> childMenus = dao.findChildMenuRoleIdAndMenuId
										(userSession.getRoleId(), menu.getId());
			menu.setChildMenus(childMenus);
		}
		return menus;
	}

	
	//Changing pwd
	@Override
	public void updatePwd(UserSession userSession, String newPwd) {
		String newPwdMd5 = MD5Utils.getMD5Str(newPwd);
		dao.updatePwdByLoginName(userSession.getLoginName(), newPwdMd5);
	}
	
	//Getting all of the user's authorities
	@Override
	public Set<Integer> getFunctionIdByRoleId(Integer roleId) {
		List<Integer> list = dao.getFunctionIdsByRoleId(roleId);
		Set<Integer> set = new HashSet<Integer>(list);
		return set;
	}

}
