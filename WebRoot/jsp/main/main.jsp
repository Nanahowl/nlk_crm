<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<%-- <base href="${pageContext.request.contextPath }/"> --%>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统界面</title>
<link href="css_js/_main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="css_js/jquery/jquery-1.3.2.min.js"></script>
<script src="css_js/popup.js" type="text/javascript"></script>
<script src="css_js/popup4nextTDate.js" type="text/javascript"></script>
<script src="css_js/popup4exExcel.js" type="text/javascript"></script>
<script src="css_js/popup4Linkman.js" type="text/javascript"></script>
<link href="css_js/general.css" rel="stylesheet" type="text/css"></link>
<script src="css_js/cal.js" type="text/javascript"></script>
<link href="css_js/calendar.css" rel="stylesheet" type="text/css"></link>
<script src="css_js/popup4exExcel_sub.js" type="text/javascript"></script>
<script type="text/javascript">
var isHide = false;
var menu_length="${fn:length(userSession.menus)}"-0;
function getNewVal(objname){
	var sel = $(window.frames[0].document).find(":select#" + objname);
	var queryString = {code:objname};

	$.ajax({
		type:"post",
		url:"getDictinaryDetails.action",
		data:queryString,
		dataType:"json",
		success: function(msg) {
			var str1 = "<option value=''>---</option>";
			if(msg.SDictionaryDetails.length > 0){
				for(var i = 0; i < msg.SDictionaryDetails.length; i++){
					str1 += "<option value='"+msg.SDictionaryDetails[i].value+"'>"+msg.SDictionaryDetails[i].value+"</option>";
				}
			}
			sel.html(str1);
		}
	});
}

function getNewVal4Linkman(objname){
	var sel = $(window.frames["right_window"].document.frames["linkmanFrame"].document).find(":select#" + objname);

	var queryString = {code:objname};

	$.ajax({
		type:"post",
		url:"getDictinaryDetails.action",
		data:queryString,
		dataType:"json",
		success: function(msg) {
			var str1 = "<option value=''>---</option>";
			if(msg.SDictionaryDetails.length > 0){
				for(var i = 0; i < msg.SDictionaryDetails.length; i++){
					str1 += "<option value='"+msg.SDictionaryDetails[i].value+"'>"+msg.SDictionaryDetails[i].value+"</option>";
				}
			}
			sel.html(str1);
		}
	});
}

$(function(){
	$(".subTreeTable td").bind("mouseover",function(){
		$(this).removeClass("mouseOutClass");
		$(this).addClass("mouseOverClass");
	});

	$(".subTreeTable td").bind("mouseout",function(){
		$(this).removeClass("mouseOverClass");
		$(this).addClass("mouseOutClass");
	});

	$(".center_control").bind("click",function(){

		if(isHide == false){
			$("#leftT").hide();
			isHide = true;
			$("#center_control_img").attr("src","image/index_center_control1.jpg");
		}else{
			$("#leftT").show();
			isHide = false;
			$("#center_control_img").attr("src","image/index_center_control.jpg");
		}
	});

	for(var i = 1; i <=menu_length; i++){
		$(".left_treeControl" + i).attr("src","image/left_tree_close.gif");
		$(".left_treeControl" + i).bind("click",function(){
			var indexNum = $(this).attr("class").substring($(this).attr("class").length-1,$(this).attr("class").length);
			if($(this).attr("src").indexOf("open") != -1){
				closeAll();
				$(this).attr("src","image/left_tree_close.gif");
				$(".left_tree" + indexNum).show();
			}else{

				$(this).attr("src","image/left_tree_open.gif");
				$(".left_tree" + indexNum).hide();
			}
		});
	}



});
$(function(){
	closeAll();
	$(".left_treeControl" + 1).attr("src","image/left_tree_close.gif");

	$(".left_tree1").show();


});

function closeAll(){
	for(var i = 1; i <=menu_length; i++){
		$(".left_treeControl" + i).attr("src","image/left_tree_open.gif");
		$(".left_tree" + i).hide();
	}
}
//判断选项以选择相应的函数
function exportExcelBySelect(){
	var o = document.getElementsByName("exportExcelOption");
	for(var i = 0; i < o.length; i++){

		if(o[i].checked){

			if(o[i].value == "excel_all"){

				exportAll("excel_all");
			}
			if(o[i].value == "excel_page"){

				exportPage("excel_page");
			}
			if(o[i].value == "excel_selected"){

				exportSelected("excel_selected");
			}
		}
	}
}

//判断选项以选择相应的函数.用于嵌套2层的iframe页面如联系人子页面

function exportExcelBySelect_sub(){
	var o = document.getElementsByName("exportExcelOption");
	for(var i = 0; i < o.length; i++){

		if(o[i].checked){

			if(o[i].value == "excel_all"){

				exportAll_sub("excel_all");
			}
			if(o[i].value == "excel_page"){

				exportPage_sub("excel_page");
			}
			if(o[i].value == "excel_selected"){

				exportSelected_sub("excel_selected");
			}
		}
	}
}
</script>

</head>

<body STYLE='OVERFLOW: HIDDEN; OVERFLOW-Y: HIDDEN'>
<table width="100%" height="100%" border="0" cellspacing="0"
	cellpadding="0">
	<tr>
		<td height="76" valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="3" class="topTd"><img src="image/logo.gif"
					width="265" height="64"></td>
			</tr>
			<tr>
				<td width="406" class="topLeft" height="30"><span
					style="color: #444444"> 欢迎您 ${userSession.loginName}</span> <span
					style="color: #0871ee">支持热线(010-82825539) </span> <span
					style="color: #ed4101">使用帮助 </span> <span style="color: #0871ee">联系我们</span></td>
				<td width="17"><img src="image/topButLine.gif" width="36"
					height="30"></td>
				<td width="568" class="topRight"><img src="image/icon/gzt.gif"
					width="16" height="15" align="absmiddle"> 工作台| <img
					src="image/icon/wdxx.gif" width="16" height="12"> 我的消息(0) | <img
					src="image/icon/wdzh.gif" width="16" height="16" align="absmiddle">
				我的账户 | <img src="image/icon/tc.gif" width="10" height="10"
					align="absmiddle"> <span style="cursor: pointer" onClick="javascript:window.location.href='${pageContext.request.contextPath}/logout'">退出</span> | <img src="image/icon/bz.gif"
					width="16" height="15" align="absmiddle"> 帮助 | <img
					src="image/icon/gy.gif" width="16" height="16" align="absmiddle">
				关于</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td height="6"></td>
	</tr>
	<tr>
		<td valign="top">
		<table width="100%" height="100%" border="0" cellspacing="0"
			cellpadding="0" id="left_tree_main">
			<tr>
				<td width="159" height="100%" valign="top" id="leftT">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="27" colspan="2" align="center"
							background="image/left_main_bg.gif"><span
							style="color: #004e7b; font-size: 14px; font-weight: bold;">操作菜单</span></td>
					</tr>

					<c:forEach items="${userSession.menus }" var="pMenu" varStatus="sta">
					<tr>
						<td class="f_td"><img align="absmiddle" src="image/left_tree5.gif" width="17" height="20"> ${pMenu.name }</td>
						<td class="f_td"><img src="image/left_tree_open.gif" width="15" height="15" style="cursor: pointer;" class="left_treeControl${sta.count }"></td>
					</tr>
					<tr class="left_tree${sta.count }">
						<td colspan="2">
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class="subTreeTable">
							<c:forEach items="${pMenu.childMenus }" var="cMenu">
							<tr>
								<td>
									<img align="absmiddle" src="image/left_tree2_1.gif" width="16" height="16"><a href="${pageContext.request.contextPath}${cMenu.url }" class="nav" target="right_window"> ${cMenu.name }</a>
								</td>
							</tr>
							</c:forEach>
						</table>
						</td>
					</tr>
					</c:forEach>
				</table>
				</td>
				<td width="8" class="center_control" valign="middle"><img
					src="image/index_center_control.jpg" id="center_control_img"></td>
				<td valign="top"><iframe src="html/workdesk.html" width="100%"
					height="100%" frameborder="0" name="right_window"></iframe></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<div id="popupContact"><a id="popupContactClose">x</a>
<h1>标题</h1>
<div id="dictionaryMsg"></div>
<p id="contactArea">这里是正文</p>
</div>
<div id="backgroundPopup"></div>

</body>
</html>
