<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="../favicon.ico" type="image/x-icon">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>北京大学图书馆</title>

<!-- 引入Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>


</head>


<frameset rows="7%,*" frameborder="no"  border="0">

	<frame src="02readerNav.jsp" scrolling="no">

	<frameset cols="14%,*" frameborder="no"  border="0">
		<frame src="03readerNavLeft.jsp">
		<%
			if(session.getAttribute("reader") == null){
		%>
				<frame src="06borrow.jsp" name="view_frame">
		<%
			}else{
				%>
				<frame src="01main.jsp" name="view_frame">
				<%
			}
		%>
	</frameset>
</frameset>
</html>