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

<link rel="stylesheet" href="css/base.css?v=1703869875630">
<link rel="stylesheet" href="css/swiper.css?v=1703869875630">
<link rel="stylesheet" href="css/index.css?v=1703869875630">
<link rel="stylesheet" id="css">


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



<div class="home_box" style="position: absolute; bottom: 0;">
  <!-- 主要板块轮播 -->
  <div class="content_box">

    <div class="swiper-slide">
      <!-- mode01开始 -->
      <div class="wrap_mode01">
        <div class="row mode01">
          <a target="_blank" class="index_title" href="2xxzzfw/26xwgg/261xwlb/index.htm">
            <div class="box">
              <img src="images/index_title.png" alt="">
              <div class="channel_title fs32">最新动态</div>
            </div>
          </a>
          <div class="lf controllers">
            <div class="index_01a ul-inline">
              <ul>
                <li>
                  <div class="item">
                    <a target="_blank" class="tip fs16"
                      href="2xxzzfw/26xwgg/261xwlb/2dbeebcb23814fb59ae927f457b90135.htm">
                      <!--  -->
                      <span>新闻</span>
                    </a>
                    <a target="_blank" href="2xxzzfw/26xwgg/261xwlb/2dbeebcb23814fb59ae927f457b90135.htm"
                      class="title fs20 lh30x1">走近中国书法系列讲座第十讲举行&#xff0c;洪厚甜主讲“体验书写&#xff0c;享受书法——书法艺术学习漫谈”</a>
                    <a target="_blank" href="2xxzzfw/26xwgg/261xwlb/2dbeebcb23814fb59ae927f457b90135.htm"
                      class="img"><img src="images/2023-11/bc7cd5d7c3c044b1ab2f29f68c0e8eff.jpg"></a>
                  </div>
                </li>
                <li>
                  <div class="item">
                    <a target="_blank" class="tip fs16"
                      href="2xxzzfw/26xwgg/261xwlb/a93af652591a48cf8afa257d95e381a5.htm">
                      <!--  -->
                      <span>新闻</span>
                    </a>
                    <a target="_blank" href="2xxzzfw/26xwgg/261xwlb/a93af652591a48cf8afa257d95e381a5.htm"
                      class="title fs20 lh30x1">
                      “纪念北京大学图书馆建馆125周年•图书馆引领的信息文化国际学术研讨会”举行</a>
                    <a target="_blank" href="2xxzzfw/26xwgg/261xwlb/a93af652591a48cf8afa257d95e381a5.htm"
                      class="img"><img src="images/2023-11/6f2510c3ccca4fa3b9666532695b99ba.jpg"></a>
                  </div>
                </li>
                <li>
                  <div class="item">
                    <a target="_blank" class="tip fs16" href="2xxzzfw/26xwgg/261xwlb/bd6527.htm">
                      <!--  -->
                      <span>新闻</span>
                    </a>
                    <a target="_blank" href="2xxzzfw/26xwgg/261xwlb/bd6527.htm"
                      class="title fs20 lh30x1">前沿科技系列讲座第三讲举行，王亦洲主讲“从ChatGPT谈具身智能与通用人工智能”</a>
                    <a target="_blank" href="2xxzzfw/26xwgg/261xwlb/bd6527.htm" class="img"><img
                        src="images/2023-10/24675d7ff34342cda525aa264034a258.jpg"></a>
                  </div>
                </li>
                <li>
                  <div class="item">
                    <a target="_blank" class="tip fs16" href="2xxzzfw/26xwgg/261xwlb/bd6499.htm">
                      <!--  -->
                      <span>新闻</span>
                    </a>
                    <a target="_blank" href="2xxzzfw/26xwgg/261xwlb/bd6499.htm"
                      class="title fs20 lh30x1">图书馆召开2023年暑期战略研讨会</a>
                    <a target="_blank" href="2xxzzfw/26xwgg/261xwlb/bd6499.htm" class="img"><img
                        src="images/2023-10/gp_th_c59f806c738545ae884290b0f0eadc63.png"></a>
                  </div>
                </li>
                <li>
                  <div class="item">
                    <a target="_blank" class="tip fs16" href="2xxzzfw/26xwgg/261xwlb/bd6438.htm">
                      <!--  -->
                      <span>新闻</span>
                    </a>
                    <a target="_blank" href="2xxzzfw/26xwgg/261xwlb/bd6438.htm"
                      class="title fs20 lh30x1">图书馆召开馆党委理论学习中心组扩大会议&#xff0c;专题学习习近平总书记关于教育、科技、人才的重要论述</a>
                    <a target="_blank" href="2xxzzfw/26xwgg/261xwlb/bd6438.htm" class="img"><img
                        src="images/2023-10/d43948df3bd74b8098e574b2e21e6674.jpg"></a>
                  </div>
                </li>
              </ul>
              <div class="swiper-pagination"></div>
            </div>
          </div>
          <div class="rt">
            <div class="index_01b ul-inline controllers">
              <ul>
                <li>
                  <div target="_blank" class="item">
                    <a href="2xxzzfw/26xwgg/262gglb/index.htm" class="tip  tip1  fs16">
                      <div class="fix_ico iconfont icon-guding-tianchong"></div>
                      <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                        <path fill-rule="evenodd"
                          d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                      </svg> 公告
                    </a>
                    <div class="time fs14">2023-12-27</div>
                    <a href="2xxzzfw/26xwgg/262gglb/835bc040760b48ab8d5f02b360f44ca4.htm"
                      class="title fs18 lh24x1">2024年元旦图书馆服务时间</a>
                  </div>
                </li>
              </ul>
              <div class="swiper_wrapper">
                <ul>
                  <li>
                    <div target="_blank" class="item">
                      <a href="2xxzzfw/26xwgg/261xwlb/index.htm" class="tip  tip2  fs16">
                        <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                          <path fill-rule="evenodd"
                            d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                        </svg>
                        新闻
                      </a>
                      <div class="time fs14">2023-12-29</div>
                      <a href="2xxzzfw/26xwgg/261xwlb/983d8043c2a74c80a9cda554da92b210.htm"
                        class="title fs18 lh24x1">“走近中国书法”第十五讲举行，朱培尔主讲“我们有过怎样的书法传统”</a>
                    </div>
                  </li>
                  <li>
                    <div target="_blank" class="item">
                      <a href="2xxzzfw/26xwgg/261xwlb/index.htm" class="tip  tip2  fs16">
                        <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                          <path fill-rule="evenodd"
                            d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                        </svg>
                        新闻
                      </a>
                      <div class="time fs14">2023-12-29</div>
                      <a href="2xxzzfw/26xwgg/261xwlb/5d90b9a045e747b9ad2419cd122403fa.htm"
                        class="title fs18 lh24x1">“数学之美”第五讲举行，马翔主讲“透视与射影——几何学帮你欣赏诗和远方的风景</a>
                    </div>
                  </li>
                  <li>
                    <div target="_blank" class="item">
                      <a href="2xxzzfw/26xwgg/261xwlb/index.htm" class="tip  tip2  fs16">
                        <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                          <path fill-rule="evenodd"
                            d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                        </svg>
                        新闻
                      </a>
                      <div class="time fs14">2023-12-28</div>
                      <a href="2xxzzfw/26xwgg/261xwlb/8824048262b04113864b6b14ce47a61f.htm"
                        class="title fs18 lh24x1">《中文核心期刊要目总览》（2023年版）已开放订购</a>
                    </div>
                  </li>
                  <li>
                    <div target="_blank" class="item">
                      <a href="2xxzzfw/26xwgg/262gglb/index.htm" class="tip  tip1  fs16">
                        <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                          <path fill-rule="evenodd"
                            d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                        </svg>
                        公告
                      </a>
                      <div class="time fs14">2023-12-28</div>
                      <a href="2xxzzfw/26xwgg/262gglb/b1c4764338314f7c8dbc418d3c34a6da.htm"
                        class="title fs18 lh24x1">关于期末考试期间图书馆延长部分阅览区域开放时间的通知</a>
                    </div>
                  </li>
                  <li>
                    <div target="_blank" class="item">
                      <a href="2xxzzfw/26xwgg/261xwlb/index.htm" class="tip  tip2  fs16">
                        <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                          <path fill-rule="evenodd"
                            d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                        </svg>
                        新闻
                      </a>
                      <div class="time fs14">2023-12-28</div>
                      <a href="2xxzzfw/26xwgg/261xwlb/a2d66d8612744f20b59d7d185d89b391.htm"
                        class="title fs18 lh24x1">“北京大学图书馆特藏文献丛刊”首批四种出版</a>
                    </div>
                  </li>
                  <li>
                    <div target="_blank" class="item">
                      <a href="hdrl/index.htm" class="tip  tip3  fs16">
                        <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                          <path fill-rule="evenodd"
                            d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                        </svg>
                        活动
                      </a>
                      <div class="time fs14">2023-12-27</div>
                      <a href="hdrl/93dfa08a559b4fd187bb3ff308a2ad62.htm"
                        class="title fs18 lh24x1">艺术鉴赏厅｜中华传统艺术之美第二十二次活动“流水犹馀弦上声——《古琴经典艺术欣赏》课堂音乐会”</a>
                    </div>
                  </li>
                  <li>
                    <div target="_blank" class="item">
                      <a href="hdrl/index.htm" class="tip  tip3  fs16">
                        <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                          <path fill-rule="evenodd"
                            d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                        </svg>
                        活动
                      </a>
                      <div class="time fs14">2023-12-27</div>
                      <a href="hdrl/93bfee42c12143e6b122d784e998a04c.htm"
                        class="title fs18 lh24x1">科学报告厅|《彤程材料科学论坛》第039讲|界面力学：基础科学与工程技术之间的桥梁</a>
                    </div>
                  </li>
                  <li>
                    <div target="_blank" class="item">
                      <a href="hdrl/index.htm" class="tip  tip3  fs16">
                        <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                          <path fill-rule="evenodd"
                            d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                        </svg>
                        活动
                      </a>
                      <div class="time fs14">2023-12-25</div>
                      <a href="hdrl/2045bff4762a4323912a863dd1969f6e.htm"
                        class="title fs18 lh24x1">艺术鉴赏厅｜走近中国书法第十六讲“‘书画同源’与‘以书入画’：书法何以成就文人画？”</a>
                    </div>
                  </li>
                  <li>
                    <div target="_blank" class="item">
                      <a href="2xxzzfw/26xwgg/261xwlb/index.htm" class="tip  tip2  fs16">
                        <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                          <path fill-rule="evenodd"
                            d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                        </svg>
                        新闻
                      </a>
                      <div class="time fs14">2023-12-22</div>
                      <a href="2xxzzfw/26xwgg/261xwlb/893da5e6bb1a43bfbec012a7ffcc20dd.htm"
                        class="title fs18 lh24x1">“走近中国书法”第十四讲举行，张旭光主讲“反丑书还是反俗书”</a>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="clear"></div>
          <div class="flex">
            <div class="index_01d ul-inline">
              <ul>
                <li>
                  <a target="_blank" class="item" href="http://newbooks.lib.pku.edu.cn/discipline.jsp">
                    <div class="title fs18 lh28">学科新增</div>
                    <i class="iconfont icon-xiangyoujiaohuan fs20"></i>
                  </a>
                </li>
                <li>
                  <a target="_blank" class="item" href="http://newbooks.lib.pku.edu.cn/singlepub.jsp">
                    <div class="title fs18 lh28">单采出版社新增</div>
                    <i class="iconfont icon-xiangyoujiaohuan fs20"></i>
                  </a>
                </li>
              </ul>
            </div>
            <div class="index_01c ul-inline">
              <ul>
                <li>
                  <a target="_blank" class="item" href="2xxzzfw/26xwgg/gm/b74008ffde594e6aa128ff3c66ebaf3d.htm">
                    <div class="tip tip4 fs16">
                      <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                        <path fill-rule="evenodd"
                          d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                      </svg> 资源
                    </div>
                    <div class="time fs14">2023-06-08</div>
                    <div class="title fs18 lh26x2">一起去选书吧&#xff01;——第29届北京国际图书博览会报名通知</div>
                  </a>
                </li>
                <li>
                  <a target="_blank" class="item" href="2xxzzfw/26xwgg/gm/7d20036bf1904b5f8de1d4513f9f28f8.htm">
                    <div class="tip tip4 fs16">
                      <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                        <path fill-rule="evenodd"
                          d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                      </svg> 资源
                    </div>
                    <div class="time fs14">2023-05-17</div>
                    <div class="title fs18 lh26x2">“以原版促馆藏 与世界共学术”—— 2023年外文原版学术图书展</div>
                  </a>
                </li>
                <li>
                  <a target="_blank" class="item" href="2xxzzfw/26xwgg/261xwlb/bd6295.htm">
                    <div class="tip tip4 fs16">
                      <svg xmlns:xlink="http://www.w3.org/1999/xlink" class="mode01_ico" viewBox="0 0 54 24">
                        <path fill-rule="evenodd"
                          d="M50,24 L4,24 C4,21.791 2.209,20 -0,20 L-0,4 C2.209,4 4,2.209 4,-0 L50,-0 C50,2.209 51.791,4 54,4 L54,20 C51.791,20 50,21.791 50,24 Z" />
                      </svg> 资源
                    </div>
                    <div class="time fs14">2023-04-11</div>
                    <div class="title fs18 lh26x2">“书香两岸 情系中华”——2023年春季港台原版学术图书展</div>
                  </a>
                </li>
              </ul>
            </div>
          </div>

          <div class="clear"></div>
        </div>
      </div>
      <!-- mode01结束 -->
                    </div>

                    
                
                    
                    
                    
                    <div class="swiper-slide">
                      <!-- mode06开始 -->
                      <div class="wrap_mode06">
                        <img src="images/mode06_img.png" alt="" class="mode06_top">
                        <div class="row mode06">
                          <div class="footer_lf">
                            <div class="footer_2 ul-inline">
                              <h3 class="fs22">联系我们</h3>
                              <ul>
                                <li>
                                  <div class="item fs16 lh30">
                                    <div class="ico iconfont icon-footer_contactus1 fs16"></div>北京市海淀区颐和园路5号 北京大学图书馆
                                  </div>
                                </li>
                                <li>
                                  <div class="item fs16 lh30">
                                    <div class="ico iconfont icon-footer_contactus2 fs16"></div>office@lib.pku.edu.cn
                                  </div>
                                </li>
                              </ul>
                            </div>
                            <div class="fs16 copy_right">版权所有©北京大学图书馆</div>
                          </div>
                          <div class="footer_rt">
                            <div class="footer_1 ul-inline">
                              <h3 class="fs22">机构链接</h3>
                              <ul>
                                <li>
                                  <div class="item">
                                    <div class="bg"></div>
                                    <a href="http://www.calis.edu.cn/" class="title fs18">CALIS</a>
                                  </div>
                                </li>
                                <li>
                                  <div class="item">
                                    <div class="bg"></div>
                                    <a href="http://www.cashl.edu.cn/" class="title fs18">CASHL</a>
                                  </div>
                                </li>
                                <li>
                                  <div class="item">
                                    <div class="bg"></div>
                                    <a href="http://www.libconsortia.edu.cn/index.action" class="title fs18">DRAA</a>
                                  </div>
                                </li>
                                <li>
                                  <div class="item">
                                    <div class="bg"></div>
                                    <a href="http://www.scal.edu.cn" class="title fs18">教育部高校图工委</a>
                                  </div>
                                </li>
                                <li>
                                  <div class="item">
                                    <div class="bg"></div>
                                    <a href="http://www.scal.edu.cn/bjcb/dxtsgxb/gqml" class="title fs18">大学图书馆学报</a>
                                  </div>
                                </li>
                              </ul>
                            </div>
                            <div class="footer_3 ul-inline">
                              <ul>
                                <li>
                                  <a class="item">
                                    <div class="ico iconfont icon-footer_link1"></div>
                                    <div class="alert_box">
                                      <img src="images/2023-09/a7835b31ee3543d8857e3fba7f8ea31b.png" alt="">
                                    </div>
                                  </a>
                                </li>
                                <li>
                                  <a href="https://weibo.com/pkulib" class="item">
                                    <div class="ico iconfont icon-footer_link2"></div>
                    
                                  </a>
                                </li>
                                <li>
                                  <a class="item">
                                    <div class="ico iconfont icon-footer_link3"></div>
                                    <div class="alert_box">
                                      <img src="images/2023-09/f7a81a4f7a9a4dcfb6b0b9c8c9e04199.png" alt="">
                                    </div>
                                  </a>
                                </li>
                              </ul>
                            </div>
                            <a href="zxt/yjfk/index.htm" class="footer_feedback fs16"><i class="iconfont icon-wj-cznr fs20"></i>网站纠错</a>
                          </div>
                          <div class="clear"></div>
                        </div>
                        <div class="index_06d only_mob">
                          <div class="img_box">
                            <img src="images/mode06_img2.png" alt="">
                          </div>
                          <div class="fs16 copy_right">版权所有©北京大学图书馆</div>
                        </div>
                      </div>
                      <!-- mode06结束 -->
                    </div>
                    </div>
                    </div>
                    <!-- 主要板块轮播结束 -->
                    
                    
                    <!-- 滚轮菜单 -->
                    <div class="top_fix_swiper top_fix_swiper1 bg2">
                      <div class="swiper-wrapper">
                        <div class="swiper-slide">
                          <div class="title fs18">首页</div>
                        </div>
                        <div class="swiper-slide">
                          <div class="title fs18">最新动态</div>
                        </div>
                    
                        <div class="swiper-slide">
                          <div class="title fs18">尾页</div>
                        </div>
                      </div>
                    </div>
    <script src="js/jquery.min.js?v=1703869875630" type="text/javascript"></script>
    <script src="js/swiper.min.js?v=1703869875630" type="text/javascript"></script>
    <script src="js/TweenMax.min.js?v=1703869875630" type="text/javascript"></script>
    <script src="js/jquery.mousewheel.min.js?v=1703869875630" type="text/javascript"></script>
    <script src="js/slick.js?v=1703869875630" type="text/javascript"></script>
    <script src="js/common.js?v=1703869875630" type="text/javascript"></script>
    <script src="js/index.js?v=1703869875630" type="text/javascript"></script>






</body>
</html>
