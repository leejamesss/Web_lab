<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>ECharts</title>
        <!-- 引入 echarts.js -->
        <script src="../public/js/echarts.min.js"></script>
        <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    </head>

    <body>
        <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
        <div id="main" style="width:1200px;height:500px;"></div>
        <script type="text/javascript">
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));

            // 指定图表的配置项和数据
            myChart.setOption({
                title: {
                    text: '做题情况'
                },
                tooltip: {
                    trigger: 'axis',
                    formatter: function (params) {
                        var tooltipText = params[0].axisValueLabel + '<br>';
                           params.forEach(function (param) {
                            if (param.seriesName === '正确率') {
                                if (param.value === 0) {
                                    tooltipText += ''; // display "" when problem number is 0
                                } else {
                                    var correctnessRate = param.value * 100; // multiply by 100
                                    tooltipText += param.marker + ' ' + param.seriesName + ': ' + correctnessRate.toFixed(0) + '%<br>'; // use toFixed(0) to remove decimal part
                                }
                            } else {
                                tooltipText += param.marker + ' ' + param.seriesName + ': ' + param.value + '<br>';
                            }
                        });
                        return tooltipText;
                    }
                },
                legend: {
                    data: ['做题量','正确率']
                },
                xAxis: {
                    data: []
                },
                yAxis: {},
                series: [{
                    name: '做题量',
                    type: 'line',
                    data: [],
                    itemStyle: { // add this
                        color: 'blue'
                    }
                }, {
                        name: '正确率', // add the new series here
                        type: 'line',
                        data: [],
                        itemStyle: {
                            color: 'green'
                        }
                    }
            ]
            });
            // 使用刚指定的配置项和数据显示图表。
            //myChart.setOption(option);
            // 异步加载数据
            $.get('./problemData').done(function (data) {
                if (data.code == 0) {
                    // 填入数据
                    myChart.setOption({
                        xAxis: {
                            data: data.data.days
                        },
                        series: [{
                            // 根据名字对应到相应的系列
                            name: '做题量',
                            data: data.data.data,
                            type: 'line',
                            itemStyle:{
                                color : 'blue'
                            }
                        }, {
                                name: '正确率', // add the new series here
                                data: data.data.correctnessRate, // assuming this is the new data
                                type: 'line',
                                itemStyle: {
                                    color: 'green'
                                }
                            }]
                    });
                } else {
                    $('body').append($("<div style='color:blue;'>调用接口失败</div>"));
                }

            });
        </script>
    </body>

    </html>