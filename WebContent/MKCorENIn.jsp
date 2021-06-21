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
<title>MKCell Cor-test</title>
<link rel="stylesheet" href="css/MKcell.css">
<link rel="icon" href="css/logo.gif">
</head>
<body>

	<nav class="nav-main">
		<a class="nav-head">MKCell</a>
		<button class="nav-tog" data-toggle="collapse" data-target="#MKnav">Menu</button>
		<div class="collapse nav-cont" id="MKnav">
			<ul class="nav-list nav-right">
				<li><a href='MKhomeENIn.html?Email=<%=Email%>'>Home</a></li>
				<li>
					<a href='MKPancENIn.html?Email=<%=Email%>'>Pan-cancer View</a>
				</li>
				<li class="active">
				    <a class="triang" href="MKalyENIn.html?Email=<%=Email%>">Analysis<span class="hiden">(current)</span></a>
					<div class="dropdown-menu">
						<a href="MKalyDCoENIn.html?Email=<%=Email%>">Cell composition</a>
						<a href="MKalyScpENIn.html?Email=<%=Email%>">Cell recognition</a>
						<a href="MKalyENIn.html?Email=<%=Email%>">Custom analysis</a>
					</div>
				</li>
				<li><a href="MKdwlENIn.html?Email=<%=Email%>">Download</a></li>
				<li><a href="MKhelpENIn.html?Email=<%=Email%>">Help</a></li>
			</ul>
			<ul class="nav-list">
				<li><a href='MKhomeCNIn.html?Email=<%=Email%>'>中文站点</a></li>
				<li class="active"><a>Hello! <%=Email%></a></li>
				<li><a href="MKhomeEN.html">Log Out</a></li>
			</ul> 
		</div>
	</nav>
<div class="adapt card text-center"><br>
 <h3><strong>Correlation Test --- MKCell</strong></h3><br>
 <img class="img-sm" src="MKupload/<%=MKID%>/MKcorRe/MK_Cor1.png" alt="Error, there is no result of this run." width = 450 height = auto>
 <img class="img-sm" src="MKupload/<%=MKID%>/MKcorRe/MK_Cor2.png" alt="Error, there is no result of this run." width = 450 height = auto><br><br>
 <a href="MKupload/<%=MKID%>/MKcorRe/MK_Cor.csv" class="btn btn-md btn-warn" role="button">Correlation.csv download</a><br><br>
 <a href="MKupload/<%=MKID%>/MKcorRe/MK_Cor1.tiff" class="btn btn-md btn-warn" role="button">Pearson.tiff download</a><br><br>
 <a href="MKupload/<%=MKID%>/MKcorRe/MK_Cor2.tiff" class="btn btn-md btn-warn" role="button">Spearman.tiff download</a><br><br>
 <a href="MKalyCorENIn.html?Email=<%=Email%>" class="btn btn-md btn-inf" role="button">Go back</a><br><br>
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