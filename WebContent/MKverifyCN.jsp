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
				<li><a href="MKloginCN.html">登陆</a></li>
				<li class="active"><a href="MKregistCN.html">注册<span class="hiden">(目前)</span></a></li>
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
	out.println("<h2 class='adapt'>恭喜，您的电子邮箱已被成功激活！</h2>");
}else{
	out.println("<h2 class='adapt'>很抱歉，这个电子邮箱已经被注册过了，请您检查更换。</h2>");
}
db.close();
rs.close();
%>

<br>
<a href="MKloginCN.html" class="btn btn-lg btn-red" role="button">立即登陆</a><br><br>
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