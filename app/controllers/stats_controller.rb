class StatsController < ApplicationController
  def index
    @visits_by_hour = Visit.group_by_hour(:created_at).count
    @chart_options = {
      dataset: {
        borderWidth: 3,
        borderColor: "#6366f1",
        pointBackgroundColor: "transparent",
        pointHoverBackgroundColor: "#6366f1",
        pointBorderColor: "transparent",
        pointHoverRadius: 6,
        tension: 0.05
      },
      library: {
        scales: {
          x: {
            grid: {
              display: false
            },
            ticks: {
              color: "#FFFFFF"
            },
            title: {
              color: "#f8fafc"
            }
          },
          y: {
            grid: {
              color: "#0f172a",
              drawTicks: true,
              drawBorder: false
            },
            beginAtZero: true,
            ticks: {
              maxTicksLimit: 8,
              color: "#FFFFFF"
            }
          }
        },
        plugins: {
          legend: {
            display: false
          },
          tooltip: {
            displayColors: false,
            intersect: false,
            padding: 16,
            backgroundColor: "rgba(15, 23, 42, 0.8)"
          }
        }
      }
    }
  end
end
