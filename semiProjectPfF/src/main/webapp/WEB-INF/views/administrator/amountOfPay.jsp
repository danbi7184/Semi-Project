<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Insert title here</title>
<link href="../../assets/styles.css" rel="stylesheet" />
<style>
    #amountOfPayChart {
      max-width: 650px;
      margin: 35px auto;
    }
</style>

<script>
      window.Promise ||
        document.write(
          '<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.min.js"><\/script>'
        )
      window.Promise ||
        document.write(
          '<script src="https://cdn.jsdelivr.net/npm/eligrey-classlist-js-polyfill@1.2.20171210/classList.min.js"><\/script>'
        )
      window.Promise ||
        document.write(
          '<script src="https://cdn.jsdelivr.net/npm/findindex_polyfill_mdn"><\/script>'
        )
</script>

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<script>
      // Replace Math.random() with a pseudo-random number generator to get reproducible results in e2e tests
      // Based on https://gist.github.com/blixt/f17b47c62508be59987b
      var _seed = 42;
      Math.random = function() {
        _seed = _seed * 16807 % 2147483647;
        return (_seed - 1) / 2147483646;
      };
</script>
</head>
<body>
<script>
	if(${loginUser == null}){
		  location.href='${ contextPath }';
	} else if(${loginUser.admin == 'N'}){
		  location.href='${ contextPath }';
	}
</script>
<div id="amountOfPayChart"></div>
<script>
var amountOfPay = {
        series: [{
        name: '결제금액',
        type: 'column',
        data: [440, 505, 414, 1000, 227, 413, 201, 352, 752, 320, 257, 160]
      }, {
        name: '7일간 평균',
        type: 'line',
        data: [23, 42, 35, 27, 43, 22, 17, 31, 22, 22, 12, 16]
      }],
        chart: {
        height: 350,
        type: 'line',
      },
      stroke: {
        width: [0, 4]
      },
      title: {
        text: '일별 결제금액'
      },
      dataLabels: {
        enabled: true,
        enabledOnSeries: [1]
      },
      labels: ['01 Jan 2001', '02 Jan 2001', '03 Jan 2001', '04 Jan 2001', '05 Jan 2001', '06 Jan 2001', '07 Jan 2001', '08 Jan 2001', '09 Jan 2001', '10 Jan 2001', '11 Jan 2001', '12 Jan 2001'],
//       xaxis: {
//         type: 'datetime'
//       },
      yaxis: [{
        title: {
          text: '결제금액',
        },
      
      }, {
        opposite: true,
        title: {
          text: '7일간 평균'
        }
      }],
      tooltip: {
          y: {
            formatter: function (val) {
              return val + " 원"
            }
          }
        }
      };

$.ajax({
	url: '${contextPath}/amountOfPay.ad',
	success: data=>{
		amountOfPay.series[0].data = data.sumPrice; // 일별금액합계 데이터
		amountOfPay.series[1].data = data.avgPrice; // 7일평균 금액 데이터
		amountOfPay.labels = data.date; // 날짜 데이터
		
		var chart = new ApexCharts(document.querySelector("#amountOfPayChart"), amountOfPay);
        chart.render();
	},
	error: data=>{
		console.log("amountOfPay실패");
	}
});

</script>
</body>
</html>