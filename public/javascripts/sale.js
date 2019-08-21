function  sale(date,targetId){
    $.ajax({    
        url:`http://127.0.0.1:3000/finance/v1/${date}lySales`,
        type:"get",
        // dataType:"json",
        success:function(result){
            var _text="";
            if(date=="month"){_text="月"}
            else if(date=="week"){_text="周"}
            else if(date=="year"){_text="年"}
            else{_text=""};
            var sales=result.map(v=>v["total"]);
            var productNames=result.map(v=>v[`${date}(delivery_date)`]+_text);
            console.log(sales);
            console.log(productNames);
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById(`${targetId}`));
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: `${_text}销报表`
                },
                tooltip: {},
                legend: {
                    data:[`${_text}销售额`]
                },
                xAxis: {
                    data: productNames
                },
                yAxis: {},
                series: [{
                    name: `${_text}销售额`,
                    type: 'bar',
                    data: sales
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    });
}