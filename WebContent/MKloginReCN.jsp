<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.MK.sql.MKserve" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MK Login</title>
<link rel="stylesheet" href="css/MKcell.css">
<link rel="icon" href="css/logo.gif">
</head>
<body>
	<nav class="nav-main">
		<a class="nav-head">MKCell</a>
		<button class="nav-tog" data-toggle="collapse" data-target="#MKnav">导航菜单</button>
		<div class="collapse nav-cont" id="MKnav">
			<ul class="nav-list nav-right">
				<li><a href="MKhomeCN.html">首页</a></li>
				<li><a href="MKloginCN.html">泛癌基因展示</a></li>
				<li><a class="triang" href="MKalyCN.html">在线分析</a>
					<div class="dropdown-menu">
						<a href="MKloginCN.html">细胞组分估测</a>
						<a href="MKloginCN.html">细胞类型识别</a>
						<a href="MKalyCN.html">自定义分析区</a>
					</div>
				</li>
				<li><a href="MKdwlCN.html">下载专区</a></li>
				<li><a href="MKhelpCN.html">帮助</a></li>
			</ul>
			<ul class="nav-list">
				<li><a href="MKhomeEN.html">English site</a></li>
				<li class="active"><a href="MKloginCN.html">登陆<span class="hiden">(目前)</span></a></li>
				<li><a href="MKregistCN.html">注册</a></li>
			</ul> 
		</div>
	</nav>

    <div class="adapt card text-center"><br>

<%
String email = request.getParameter("MKuser");
String pwd = request.getParameter("MKpwd");

ResultSet rs;
MKserve db = new MKserve();
db.open();
String sel="select * from mkusersql where Eemail = '"+email+"'";
rs = db.execute(sel);
if(rs.next()){
	String dpwd = rs.getString("password");
	if(dpwd.equals(pwd)){
		int order = rs.getInt("order");
		session.setAttribute("useid", order);
		session.setAttribute("MkID", email);
		response.sendRedirect("MKhomeCNIn.html?Email="+email);
	}else{
		out.println("<h2 class='adapt'>很抱歉，您输入的电子邮箱或密码有误，请您再次登陆！</h2>");
	}
}else{
	out.println("<h2 class='adapt'>很抱歉，这个电子邮箱尚未进行注册，您可以先进行注册！</h2>");
}
db.close();
rs.close();
%>

<br>
<a href="MKregistCN.html" class="btn btn-lg btn-warn" role="button">前往注册</a>
&nbsp;&nbsp;
<a href="MKloginCN.html" class="btn btn-lg btn-inf" role="button">重新登陆</a><br><br>
</div>

</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap-4.3.1.js"></script>
<script src="https://eqcn.ajz.miesnfu.com/wp-content/plugins/wp-3d-pony/live2dw/lib/L2Dwidget.min.js"></script>
<script>
    L2Dwidget.init({
        "model": {
            jsonPath: "https://unpkg.com/live2d-widget-model-koharu@1.0.5/assets/koharu.model.json",
            "scale": 0.5},
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