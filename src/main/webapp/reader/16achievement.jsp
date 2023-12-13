<%--
  Created by IntelliJ IDEA.
  User: franc
  Date: 2023/12/8
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/bootstrap-table.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap-table.js"></script>
    <script src="../bootstrap-table-zh-CN.js"></script>
    <link rel="stylesheet" href="../public/layui/css/layui.css"  media="all">
    <link rel="stylesheet" type="text/css" href="achievement.css" />
    <title>achievement</title>
</head>
<body>

<div class="status-container">
    <div class="card">
        <div class="Card-header">
            <span class="title">当前做题等级:Level 2</span>
            <span><a href="#">规则说明</a></span>
        <hr />
        </div>
    </div>
    <div class="figure">
        <div id="fh"><span class="glyphicon glyphicon-tint">&nbsp;做题得分雷达图</span></div>
<%--        雷达图后续vue.Echarts实现--%>
        <div class="radar">
        <img src="https://pic4.zhimg.com/v2-40f29e72d1fc2e7bcee2a233df71fa7a_r.jpg" height="500px" />
        </div>
    </div>
</div>
<div class="connect" ></div>
<div class="award-container">
    <div class="title">我的奖章墙</div>
    <table id="t1" width="800px" cellspacing="10px" cellpadding="20px" >
        <tr style="height: 100px">
            <td><div class="award_name">初出茅庐</div>
                <div class="award_index">做对第一道题</div></td>
            <td><div class="award_name">做题高手</div>
                <div class="award_index">做题数量超过100道</div></td>
            <td><div class="award_name">努力之星</div>
                <div class="award_index">连续一周练习题目</div></td>
        </tr>
        <tr style="height: 100px">
            <td><div class="award_name">初出茅庐</div>
                <div class="award_index">做对第一道题</div></td>
            <td><div class="award_name">做题高手</div>
                <div class="award_index">做题数量超过100道</div></td>
            <td><div class="award_name">努力之星</div>
                <div class="award_index">连续一周练习题目</div></td>
        </tr>
        <tr style="height: 100px">
            <td><div class="award_name">初出茅庐</div>
                <div class="award_index">做对第一道题</div></td>
            <td><div class="award_name">做题高手</div>
                <div class="award_index">做题数量超过100道</div></td>
            <td><div class="award_name">努力之星</div>
                <div class="award_index">连续一周练习题目</div></td>
        </tr>
    </table>
</div>
</body>
</html>
