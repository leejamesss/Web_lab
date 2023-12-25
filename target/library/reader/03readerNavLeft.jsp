<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>


<!-- 引入Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="css/style.css" rel="stylesheet">
	<link href="css/slick.css" rel="stylesheet">
	<link href="css/robot.css" rel="stylesheet">
	<link href="js/swiper.css" rel="stylesheet">


<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<style>
/* 隐藏子菜单并设置为绝对定位 */
.sub {
    display: none;
    position: absolute;
    left: 100%; /* Position to the right of the parent li */
    top: 0; /* Align with the top of the parent li */
    width: 200px; /* Set a width for the submenu */
    background-color: white; /* Add a background color for visibility */
}

/* 当鼠标悬停在li元素上时，显示子菜单 */
li:hover .sub {
    display: block;
}
	</style>

</head>

<body>

<div class="snav">
	<div class="close"></div>
	<div class="hd-menu">
	</div>
	
	<div class="snav-menu"></div>
	<ul>
		<li>
			<a href="01main.jsp" target="view_frame" class="v1">查看首页</a>
		</li>
		<li>
			<a href="05book.jsp" target="view_frame" class="v1">图书查询</a>

		</li>
		<li>
			<a href="09couse.jsp" target="view_frame" class="v1">课程查询</a>

		</li>
		<li>
			<a href="12rules.jsp" target="view_frame" class="v1">读者规则</a>

		</li>
		<li>
			<a href="07announcement.jsp" target="view_frame" class="v1">查看公告</a>
		</li>

		<li>
			<a href="13message.jsp" target="view_frame" class="v1">读者留言</a>
		</li>
		
		<% if(session.getAttribute("reader")!=null){ %>
		<li>
			<a href="16mine.html" target="view_frame" class="v1">我的空间</a>
			<dl class="sub">
				<dd><a href="16achievement.jsp" target="view_frame">我的成就</a></dd>
				<dd><a href="16collections.html" target="view_frame">我的收藏</a></dd>
				<dd><a href="index.jsp" target="view_frame">我的账号</a></dd>
				<dd><a href="16borrow.html" target="view_frame">我的借阅</a></dd>
				<dd><a href="17friend.jsp" target="view_frame">我的好友</a></dd>
			</dl>
		</li>

		<li>
			<a href="08illegalInfo.jsp" target="view_frame" class="v1">违章信息</a>
		</li>

		<li>
			<a href="10reDirect.jsp" target="view_frame" class="v1">智能出题</a>
		</li>

		<!-- 18recommend.jsp -->
		<!-- <li>
			<a href="18recommend.jsp" target="view_frame" class="v1">猜你喜欢</a>
		</li> -->
		<% } %>

	</ul>
</div>

<script src="js/lib.js"></script>
<script src="js/count.js"></script>
<script src="js/index.js"></script>
<script src="js/js.js"></script>
<script src="js/swiper.jquery.min.js"></script>

</body>
</html>
