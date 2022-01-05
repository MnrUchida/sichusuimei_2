import Chart from 'chart.js/auto';

function createGogyoRaderChart(element, gogyo) {
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

function createGogyoLineChart(element, gogyo) {
  const data = {
    labels: gogyo['dates'],
    datasets: [
      {
        label: '木',
        data: gogyo['ki'],
        borderColor: 'rgba(0, 0, 255, 1)',
        backgroundColor: 'rgba(0, 0, 255, 0.5)',
      },
      {
        label: '火',
        data: gogyo['hi'],
        borderColor: 'rgba(255, 0, 0, 1)',
        backgroundColor: 'rgba(255, 0, 0, 0.5)',
      },
      {
        label: '土',
        data: gogyo['tsuchi'],
        borderColor: 'rgba(255, 255, 0, 1)',
        backgroundColor: 'rgba(255, 255, 0, 0.5)',
      },
      {
        label: '金',
        data: gogyo['kane'],
        borderColor: 'rgba(200, 200, 200, 1)',
        backgroundColor: 'rgba(200, 200, 200, 0.5)',
      },
      {
        label: '水',
        data: gogyo['mizu'],
        borderColor: 'rgba(0, 0, 0, 1)',
        backgroundColor: 'rgba(0, 0, 0, 0.5)',
      },
    ]
  };
  const config = {
    type: 'line',
    data: data,
    options: {
      responsive: true,
      scales: {
        y: {
          beginAtZero: true,
        }
      },
      plugins: {
        legend: {
          position: 'top',
        },
        title: {
          display: false
        }
      }
    },
  };
  new Chart(element, config)
}

window.addEventListener('load', (event) => {
  document.querySelectorAll(".gogyo-graph").forEach((graph) => {
    createGogyoRaderChart(graph, JSON.parse(graph.dataset["gogyo"]))
  });
  document.querySelectorAll(".gogyo-line").forEach((graph) => {
    createGogyoLineChart(graph, JSON.parse(graph.dataset["gogyo"]))
  });
});
