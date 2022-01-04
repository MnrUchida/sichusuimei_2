import Chart from 'chart.js/auto';

const createGogyoChart = function createGogyoChart(element, gogyo) {
  let labels = []
  for (let [key, value] of Object.entries(gogyo)) { labels.push(`${key}(${value})`) }
  const data = {
    labels: labels,
    datasets: [{
      label: '五行値',
      data: Object.values(gogyo),
      fill: false,
      backgroundColor: 'rgba(255, 255, 255, 0.2)',
      borderColor: 'rgb(0, 0, 0)',
      pointBackgroundColor: 'rgb(0, 0, 0)',
      pointBorderColor: '#fff',
      pointHoverBackgroundColor: '#fff',
      pointHoverBorderColor: 'rgb(0, 0, 0)'
    }]
  };
  const config = {
    type: 'radar',
    data: data,
    options: {
      responsive: true,
      scales: {
        r: {
          beginAtZero: true,
          pointLabels: {
            font: {
              size: 20
            }
          },
          ticks: {
            font: {
              size: 20
            }
          }
        }
      },
      elements: {
        line: {
          borderWidth: 3
        }
      },
      plugins: {
        legend: {
          display: false
        }
      }
    },
  };

  new Chart(element, config)
}

window.addEventListener('load', (event) => {
  document.querySelectorAll(".gogyo-graph").forEach((graph) => {
    createGogyoChart(graph, JSON.parse(graph.dataset["gogyo"]))
  });
});
