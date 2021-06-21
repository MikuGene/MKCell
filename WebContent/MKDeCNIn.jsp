<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="org.apache.struts2.ServletActionContext" %>

<%
int MKID = (int) session.getAttribute("useid"); 
String Email = (String) session.getAttribute("MkID"); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MKCell DE-gene</title>
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
				<li>
					<a href='MKPancCNIn.html?Email=<%=Email%>'>泛癌基因展示</a>
				</li>
				<li class="active">
				    <a class="triang" href="MKalyCNIn.html?Email=<%=Email%>">在线分析<span class="hiden">(目前)</span></a>
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
				<li class="active"><a>您好！ <%=Email%></a></li>
				<li><a href="MKhomeCN.html">登出</a></li>
			</ul> 
		</div>
	</nav>
	
<div class="adapt card text-center"><br>
 <h3><strong>差异表达基因识别 --- MKCell</strong></h3><br>
 <img class="img-sm" src="MKupload/<%=MKID%>/MKdeRe/MK_De.png" alt="Error, there is no result of this run." width = 500 height = auto><br><br>
 <a href="MKupload/<%=MKID%>/MKdeRe/MK_De.csv" class="btn btn-md btn-warn" role="button">DE-gene result.csv 下载</a><br><br>
 <a href="MKupload/<%=MKID%>/MKdeRe/MK_De.tiff" class="btn btn-md btn-warn" role="button">DE-gene plot.tiff 下载</a><br><br>
 <a href="MKalyDeCNIn.html?Email=<%=Email%>" class="btn btn-md btn-inf" role="button">回退</a><br><br>
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
		    "scale":0.5},
        "react": {
            "opacityDefault": 0.9,
            "opacityOnHover": 0.2}});
</script>
</html>