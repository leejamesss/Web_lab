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

.showCarousel{
	/* margin-top:2%; */
    position: fixed; /* Fix the position */
    top: 0; /* Align with the top of the page */
    left: 0; /* Align with the left of the page */
    width: 100%; /* Set the width to 100% of the page */
    height: 100%; /* Set the height to 100% of the page */
    z-index: -1; /* Place the carousel behind other content */
}
.showCarousel .carousel-inner,
.showCarousel .carousel-inner > .item {
    height: 100%; /* Set the height to 100% */
}

.showCarousel .carousel-inner > .item > img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
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

#video-container {
    position: fixed; /* Fix the position */
    top: 0; /* Align with the top of the page */
    left: 0; /* Align with the left of the page */
    width: 100%; /* Set the width to 100% of the page */
    height: 100%; /* Set the height to 100% of the page */
    z-index: 9999;

}

#video-container video {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover; /* Scale the video to cover the container */
}
  </style>
  <style>
    body {
      display: flex;
      flex-direction: column;
      min-height: 100vh;
      margin: 0;
    }
  
    .home_box {
      margin-top: auto;
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
      <!-- <img src="../public/image/1.jpg" alt="..." link="https://www.lib.pku.edu.cn/2xxzzfw/26xwgg/261xwlb/a2d66d8612744f20b59d7d185d89b391.htm"> -->
      <a href="https://www.lib.pku.edu.cn/2xxzzfw/26xwgg/261xwlb/a2d66d8612744f20b59d7d185d89b391.htm" target="_blank">
        <img src="../public/image/1.jpg" alt="...">
      </a>
      <div class="carousel-caption">
		<font style="color:white;">“北京大学图书馆特藏文献丛刊”首批四种出版</font>
      </div>
    </div>
    <div class="item">
      <!-- <img src="../public/image/2.jpg" alt="..."> -->
            <a href="http://hxqk.lib.pku.edu.cn/" target="_blank">
              <img src="../public/image/2.png" alt="...">
            </a>
      <div class="carousel-caption">
		<font style="color:white;">《中文核心期刊要目总览》2023年版评价完成，点此订购</font>
      </div>
    </div>
	<div class="item">
      <!-- <img src="../public/image/3.jpg" alt="..."> -->
            <a href="https://www.lib.pku.edu.cn/hdrl/b46f7c5411e54b9a9130caaca67e8510.htm" target="_blank">
              <img src="../public/image/4.jpg" alt="...">
            </a>
      <div class="carousel-caption">
		<font style="color:white;">展览｜芸台丹青：北京大学图书馆藏书画珍品展</font>
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
