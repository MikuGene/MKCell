<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.struts2.ServletActionContext" %>

<%
String Email = (String) session.getAttribute("MkID");
String ScD = request.getParameter("ScD");
String Gene = request.getParameter("Tgene");
int MKID = (int) session.getAttribute("useid"); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MKCell scRNA Plot</title>
<link rel="stylesheet" href="css/MKcell.css">
<link rel="icon" href="css/logo.gif">
</head>
<body>

	<nav class="nav-main">
		<a class="nav-head">MKCell</a>
		<button class="nav-tog" data-toggle="collapse" data-target="#MKnav">导航菜单</button>
		<div class="collapse nav-cont" id="MKnav">
			<ul class="nav-list nav-right">
				<li><a href='MKhomeCNIn.html?Email=<%=Email%>'>首页</a></li>
				<li class="active">
					<a href='MKPancCNIn.html?Email=<%=Email%>'>泛癌基因展示<span class="hiden">(目前)</span></a>
				</li>
				<li>
				    <a class="triang" href="MKalyCNIn.html?Email=<%=Email%>">在线分析</a>
					<div class="dropdown-menu">
						<a href="MKalyDCoCNIn.html?Email=<%=Email%>">细胞组分估测</a>
						<a href="MKalyScpCNIn.html?Email=<%=Email%>">细胞类型识别</a>
						<a href="MKalyCNIn.html?Email=<%=Email%>">自定义分析区</a>
					</div>
				</li>
				<li><a href="MKdwlCNIn.html?Email=<%=Email%>">下载专区</a></li>
				<li><a href="MKhelpCNIn.html?Email=<%=Email%>">帮助</a></li>
			</ul>
			<ul class="nav-list">
				<li><a href='MKhomeENIn.html?Email=<%=Email%>'>English site</a></li>
				<li class="active"><a>Hello! <%=Email%></a></li>
				<li><a href="MKhomeCN.html">登出</a></li>
			</ul> 
		</div>
	</nav>

<div class="adapt card text-center"><br>
 <h3><strong>单细胞测序基因展示 --- MKCell</strong></h3><br>
 <img class="img-sm" src="MKupload/<%=MKID%>/MKscpRe/MK_global.png" alt="Error, there is no result of this run." width = 80% height = auto><br><br>
 <img class="img-sm" src="MKupload/<%=MKID%>/MKscpRe/MK_scg_tSNE.png" alt="Error, there is no result of this run." width = 80% height = auto><br><br>
 <img class="img-sm" src="MKupload/<%=MKID%>/MKscpRe/MK_scg_vln.png" alt="Error, there is no result of this run." width = 80% height = auto><br><br>
 <a href="MKupload/<%=MKID%>/MKscpRe/MK_global.tiff" class="btn btn-md btn-warn" role="button">下载 Global-tSNE Tiff</a><br><br>
 <a href="MKupload/<%=MKID%>/MKscpRe/MK_scg_tSNE.tiff" class="btn btn-md btn-warn" role="button">下载 Gene-tSNE Tiff</a><br><br>
 <a href="MKupload/<%=MKID%>/MKscpRe/MK_scg_vln.tiff" class="btn btn-md btn-warn" role="button">下载 Gene-vln Tiff</a><br><br>
 <a class='btn btn-md btn-inf' role='button' href='MKPancCNIn.html?Email=<%=Email%>'>回退</a><br><br>
</div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<script src="https://eqcn.ajz.miesnfu.com/wp-content/plugins/wp-3d-pony/live2dw/lib/L2Dwidget.min.js"></script>
<script>
    L2Dwidget.init({
        "model": {
            jsonPath: "https://unpkg.com/live2d-widget-model-koharu@1.0.5/assets/koharu.model.json",
            "scale": 1},
        "display": {
            "position": "right",
            "width": 80,
            "height": 160,
            "hOffset": 0,
            "vOffset": -20},
        "mobile": {
            "show": true,
            "scale": 0.5},
        "react": {
            "opacityDefault": 0.9,
            "opacityOnHover": 0.2}});
    </script>
</html>