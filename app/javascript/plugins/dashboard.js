const initDashboard = () => {
  const chartElement = document.getElementById('myChart');

  if (chartElement) {
    const labels = JSON.parse(chartElement.dataset.labels);
    const percentages = JSON.parse(chartElement.dataset.percentages)
    var ctx = document.getElementById('myChart').getContext('2d');
    var myDoughnutChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: labels,
            datasets: [{
                data: percentages,
                borderWidth: 0,
                backgroundColor: [
                    'rgba(182, 60, 60, 1)',
                    'rgba(163, 215, 255, 1)',
                    'rgba(81, 129, 167, 1)',
                    'rgba(62, 62, 62, 1)',
                    'rgba(242, 103, 102, 1)',
                    'rgba(73, 160, 235, 1)'
                ],
                hoverBackgroundColor: [
                    'rgba(182, 60, 60, 0.6)',
                    'rgba(163, 215, 255, 0.6)',
                    'rgba(81, 129, 167, 0.6)',
                    'rgba(62, 62, 62, 0.6)',
                    'rgba(242, 103, 102, 0.6)',
                    'rgba(73, 160, 235, 0.6)'
                ],
            }],
          },
        options:{
          legend: {
            display:false
          }
        }
    });
  }
}

export { initDashboard };
