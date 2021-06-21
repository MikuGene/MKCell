<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.MK.sql.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MK Verify</title>
<link rel="stylesheet" href="css/MKcell.css">
<link rel="icon" href="css/logo.gif">
</head>
<body>
	<nav class="nav-main">
		<a class="nav-head">MKCell</a>
		<button class="nav-tog" data-toggle="collapse" data-target="#MKnav">Menu</button>
		<div class="collapse nav-cont" id="MKnav">
			<ul class="nav-list nav-right">
				<li><a href="MKhomeEN.html">Home</a></li>
				<li><a href="MKloginEN.html">Pan-cancer View</a></li>
				<li><a class="triang" href="MKalyEN.html">Analysis</a>
				    <div class="dropdown-menu">
						<a href="MKloginEN.html">Cell composition</a>
						<a href="MKloginEN.html">Cell recognition</a>
						<a href="MKalyEN.html">Custom analysis</a>
					</div>
				</li>
				<li><a href="MKdwlEN.html">Download</a></li>
				<li><a href="MKhelpEN.html">Help</a></li>
			</ul>
			<ul class="nav-list">
				<li><a href="MKhomeCN.html">中文站点</a></li>
				<li><a href="MKloginEN.html">Log In</a></li>
				<li class="active"><a href="MKregistEN.html">Register<span class="hiden">(current)</span></a></li>
			</ul> 
		</div>
	</nav>
	
	<div class="adapt card text-center"><br>
<%
String yzm = request.getParameter("yzm");
String pwd = request.getParameter("pwd");
String eemail = request.getParameter("eemail");

ResultSet rs;
MKserve db = new MKserve();
db.open();

String sel="select * from mkusersql where Eemail = '"+eemail+"'";
rs = db.execute(sel);
if(!rs.next()){
	sel="Insert into mkusersql(Eemail,password,yzm) values(?,?,?)";
	PreparedStatement pstmt = db.exeUpdate(sel);
	pstmt.setString(1, eemail);
	pstmt.setString(2, pwd);
	pstmt.setString(3, yzm);
	int n=pstmt.executeUpdate();
	out.println("<h2 class='adapt'>OK, your email has been activated successfully.</h2>");
}else{
	out.println("<h2 class='adapt'>The email has been used, please change another one.</h2>");
}
db.close();
rs.close();
%>

<br>
<a href="MKloginEN.html" class="btn btn-lg btn-red" role="button">Login now</a><br><br>
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