package com.isoft.crm.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 *@Title: MenuBean.java
 *@Package: com.isoft.crm.bean
 *@Description:
 *		store the info of the user authority.
 *		the authority will judge the displaying part of the menu tree.
 *@author: Nina Zhao
 *@date:下午11:01:16
 */

public class MenuBean implements Serializable{

	private static final long serialVersionUID = -8580855256008180777L;

	private Integer id;//唯一标识
	private String url;//超链接
	private String img;//图片地址
	private Integer parentId;//父菜单
	private Integer exist;//菜单状态
	private List<MenuBean> childMenus = new ArrayList<MenuBean>();//子菜单；
	private boolean flag;//是否拥有此权限
	private String name;//名称
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Integer getExist() {
		return exist;
	}
	public void setExist(Integer exist) {
		this.exist = exist;
	}
	public List<MenuBean> getChildMenus() {
		return childMenus;
	}
	public void setChildMenus(List<MenuBean> childMenus) {
		this.childMenus = childMenus;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
