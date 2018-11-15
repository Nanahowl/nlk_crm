package com.isoft.crm.bean;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

/**
 * 
 *@Title: UserSession.java
 *@Package: com.isoft.bean
 *@Description:
 *		Storing the main part of the user info.
 *
 *@author: Nina Zhao
 *@date:下午10:58:21
 */

public class UserSession implements Serializable{


	private static final long serialVersionUID = 887163811362870771L;
	
	private Integer id;//主键
	private String loginName;//登录名/账号
	private String loginPwd;//密码
	private String name;//用户姓名
	private String status;//用户状态
	private String jobName;//职位名称
	private Integer roleId;//角色编号
	private Integer jobId;//职位编号
	private List<MenuBean> menus;//菜单
	private Set<Integer> functionIds;//所有功能(权限)id集合
	private Integer departmentId;//部门编号
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginPwd() {
		return loginPwd;
	}
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getJobId() {
		return jobId;
	}
	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}
	public List<MenuBean> getMenus() {
		return menus;
	}
	public void setMenus(List<MenuBean> menus) {
		this.menus = menus;
	}
	public Set<Integer> getFunctionIds() {
		return functionIds;
	}
	public void setFunctionIds(Set<Integer> functionIds) {
		this.functionIds = functionIds;
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	
	
}
