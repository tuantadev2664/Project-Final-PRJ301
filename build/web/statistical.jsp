<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    <script>
        window.onload = function () {
            var dataPoints = [
                { x: 1, y: ${requestScope.t1} },
                { x: 2, y: ${requestScope.t2} },
                { x: 3, y: ${requestScope.t3} },
                { x: 4, y: ${requestScope.t4} },
                { x: 5, y: ${requestScope.t5} },
                { x: 6, y: ${requestScope.t6} },
                { x: 7, y: ${requestScope.t7} },
                { x: 8, y: ${requestScope.t8} },
                { x: 9, y: ${requestScope.t9} },
                { x: 10, y: ${requestScope.t10} },
                { x: 11, y: ${requestScope.t11} },
                { x: 12, y: ${requestScope.t12} }
            ];

            // Find the maximum y value and its index
            var maxIndex = 0;
            var maxValue = dataPoints[0].y;
            for (var i = 1; i < dataPoints.length; i++) {
                if (dataPoints[i].y > maxValue) {
                    maxValue = dataPoints[i].y;
                    maxIndex = i;
                }
            }

            // Set properties for the highest point
            dataPoints[maxIndex].indexLabel = "\u2191 cao nhất"; // Unicode for ↑
            dataPoints[maxIndex].markerColor = "red";
            dataPoints[maxIndex].markerType = "triangle";

            var chart = new CanvasJS.Chart("chartContainer", {
                animationEnabled: true,
                theme: "light2",
                title: {
                    text: "Thống kê kết quả kinh doanh"
                },
                axisX: {
                    title: "Tháng",
                    interval: 1,
                    minimum: 1,
                    maximum: 12
                },
                data: [{
                    type: "line",
                    indexLabelFontSize: 16,
                    dataPoints: dataPoints
                }]
            });

            chart.render();
        }
    </script>
</head>
<body>
    <div id="chartContainer" style="height: 300px; width: 100%;"></div>
</body>
</html>
