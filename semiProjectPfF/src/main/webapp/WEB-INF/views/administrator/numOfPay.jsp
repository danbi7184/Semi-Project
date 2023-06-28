<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="../../assets/styles.css" rel="stylesheet" />
<style>
    #numOfPayChart {
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
<div id="numOfPayChart"></div>
<script>

	
        var numOfPay = {
          series: [{
          name: '결제자 수',
          data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
        }, {
          name: '결제 수',
          data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
        }],
          chart: {
          type: 'bar',
          height: 350
        },
        title: {
            text: '일별 결제/결제자 수'
          },
        plotOptions: {
          bar: {
            horizontal: false,
            columnWidth: '55%',
            endingShape: 'rounded'
          },
        },
        dataLabels: {
          enabled: false
        },
        stroke: {
          show: true,
          width: 2,
          colors: ['transparent']
        },
        xaxis: {
          categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
        },
        yaxis: {
          title: {
            text: '일별 결제/결제자 수'
          }
        },
        fill: {
          opacity: 1
        },
        tooltip: {
          y: {
            formatter: function (val) {
              return val
            }
          }
        }
        };

        $.ajax({
			url: '${contextPath}/numOfPay.ad',
			success: data=>{
				numOfPay.series[0].data = data.numPayer; // 결제자 수 데이터
				numOfPay.series[1].data = data.numPay; // 결제 수 데이터
				numOfPay.xaxis.categories = data.date; // 날짜 데이터

				var numOfPayChart = new ApexCharts(document.querySelector("#numOfPayChart"), numOfPay);
			    numOfPayChart.render();

			},
			error: data=>{
				console.log("numOfPay실패");
			}
		});


</script>
</body>
</html>