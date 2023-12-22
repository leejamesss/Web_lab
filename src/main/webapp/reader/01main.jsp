<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
    <style>
        #video-container {
            display: none;
            width: 100%;
            height: 100%;
        }
    </style>
<style>
.showCarousel  .carousel-inner > .item > img {

    display: block;
    width:100%;
    height:620px;
}
.showCarousel{
	margin-top:2%;
}
font{
	font-size:40px;
	color:black;
	font-family:YouYuan;
	font-weight:900;
}
.carousel-caption{
	margin-bottom:10%;
}
</style>
  <style>
    @keyframes fadeIn {
      from {
        opacity: 0;
      }
      to {
        opacity: 1;
      }
    }

    @keyframes fadeOut {
      from {
        opacity: 1;
      }
      to {
        opacity: 0;
      }
    }

    .fade-in {
      animation: fadeIn 1s forwards;
    }

    .fade-out {
      animation: fadeOut 1s forwards;
    }
  </style>
</head>
<body>

<div id="video-container">
    <video src="digital_human_long.mp4" autoplay></video>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
      const videoContainer = document.getElementById("video-container");
      if (videoContainer) {
        videoContainer.style.display = "block";
        videoContainer.classList.add("fade-in");
      }

    const video = document.querySelector("video");
    video.addEventListener("ended", function() {
      video.pause();
      videoContainer.style.display = "none";
      videoContainer.classList.add("fade-out");

      const home = document.getElementById("carousel-example-generic");
      home.style.display = "block";
      home.classList.add("fade-in");
    });
    });

</script>
<%
	if(session.getAttribute("reader")!=null && session.getAttribute("reader_first")!=null &&session.getAttribute("reader_first").equals("1")){
		session.setAttribute("reader_first", "2");
		//session.setAttribute("reader", session.getAttribute("reader"));
		
%>
		<script>window.parent.location.href = "./04readerFrame.jsp";</script>
		
<%
	}
%>


<div id="carousel-example-generic" class="carousel slide showCarousel" data-ride="carousel" data-interval="2000" style="width:96%;margin-left:2%;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="../public/image/1.jpg" alt="...">
      <div class="carousel-caption">
		<font style="color:white;">芸台为梯 青云万里</font>
      </div>
    </div>
    <div class="item">
      <img src="../public/image/2.jpg" alt="...">
      <div class="carousel-caption">
		<font style="color:white;">新时代 新青年</font>
      </div>
    </div>
	<div class="item">
      <img src="../public/image/3.jpg" alt="...">
      <div class="carousel-caption">
		<font style="color:white;">书之岁华 新展宏图</font>
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</body>
</html>