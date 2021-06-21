<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.MK.sql.*" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MKCell Email</title>
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
String pwd = request.getParameter("MKpwd");
String eemail = request.getParameter("MKmail");
long yzm = System.currentTimeMillis();

ResultSet rs;
MKserve db = new MKserve();
db.open();
String sel="select * from mkusersql where Eemail = '"+eemail+"'";
rs = db.execute(sel);
if(!rs.next()){
	MKmail operation = new MKmail();
	String email_to = request.getParameter("MKmail");
	String email_subject = "Please verify your MK-Cell account !";
	String email_host = "smtp.126.com";
	StringBuffer email_sb = new StringBuffer();
	email_sb.append("<!DOCTYPE> 欢迎注册 MKCell ！ 请您确认： <br>您的电子邮箱： "+eemail+"  <br>您的密码： "+pwd+"  <br>请您点击此链接激活账号： "+"<a href=\"http://hpvgroup.imwork.net/MKCell/MKverifyCN.jsp?eemail="+eemail+"&yzm="+yzm+"&pwd="+pwd+"\">点击这里激活您的账号！</a>");
	try {
	    String res = operation.sendMail(email_host, email_to, email_subject, email_sb.toString());
	    out.println("<h2 class='adapt'>发送验证邮件成功，请您前往邮箱激活您的账号。</h2>");
	} catch (Exception e) {
	    e.printStackTrace();
	}
}else{
	out.println("<h2 class='adapt'>您好，这个邮件已经被注册过了，请您检查您的邮箱拼写，或更换邮箱，或与我们联系。（首页尾部联系方式）</h2>");
}
db.close();
rs.close();
%>

<br>
<a href="MKregistCN.html" class="btn btn-lg btn-warn" role="button">继续注册</a>
&nbsp;&nbsp;
<a href="MKloginCN.html" class="btn btn-lg btn-inf" role="button">立即登陆</a><br><br>
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