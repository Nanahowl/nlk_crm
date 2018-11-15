<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="css_js/jquery/jquery-1.3.2.min.js"></script>
<link href="css_js/index.css" rel="stylesheet" type="text/css"></link>
<title>添加角色</title>
<script type="text/javascript">
	function submitForm(){
		$("#roleForm").submit();
	}
	//返回
	function back(){
		window.location.href="${pageContext.request.contextPath}/role";
	}

</script>
</head>

<body STYLE='OVERFLOW:SCROLL;OVERFLOW-X:HIDDEN'>
	<form action="role/add" name="form1" method="post" id="roleForm">
		<%-- <input type="hidden" name="id" id="edit_id" value="${role.id }" /> --%>
		<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_main_table">
			<tr>
				<td height="26" width="100%">
				
					<span id="function_show" style="color:#002450; font-size:13px; font-weight:bold;">角色新建</span>
				</td>
			</tr>
		</table>

		<table width="99%" border="0" cellspacing="0" cellpadding="0" id="index_content">
			<tr>
				<td height="12"></td>
			</tr>
			<tr>
				<td valign="middle">
					<img src="image/s10.gif" width="58" height="22" style="cursor: pointer;" onclick="submitForm();">
					<img src="image/s8.gif" width="59" height="22" style="cursor: pointer;" onclick="back();">
				</td>
			</tr>
			<tr>
				<td id="errorInfo" style="font-size:12px;color:red;">${mess }
				</td>
			</tr>
			<tr>
				<td valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0" id="index_main_div1">
					<tr>
						<td height="21" valign="top" background="image/index_main_div_titleBg.gif">
							<img style="margin-left:5px;" src="image/index_main_div_left.gif" width="6" height="2" align="absmiddle">&nbsp;
							<span style="font-weight:bold;font-size:12px;">基本信息</span>
						</td>
					</tr>
						<tr>
							<td height="56" align="left" valign="top" bgcolor="#f7fbfc">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" id="selectTable">
									<tr>
										<td width="10%">
											<span style="color:#FF0000">角色名称:</span>
										</td>
										<td width="40%">
											<input type="text" name="name" value="" class="addCText">
										</td>
										<td width="50%">&nbsp;</td>
									</tr>

									<!-- <tr>
			                            <td width="10%">名称:</td>
			                            <td width="37%"><input type="text" name="name" class="addCText" value=""></td>
			                            <td width="10%" align="left">编码:</td>
			                            <td width="42%"><input type="text" name="code" class="addCText" value=""></td>
			                            <td width="1%">&nbsp;</td>
									</tr> -->
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td valign="middle">&nbsp;</td>
			</tr>
		</table>
	</form>
</body>
</html>
