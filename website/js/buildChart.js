


function buildChart(id, dataType) {

	$.getJSON("https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-andamento-nazionale.json")
	.done(function( res ) {
		let jsonData = res;

		let labels = [];
		let data = [];

		for (let i = 0; i < jsonData.length; i++) {
			
            day = String(jsonData[i]['data']);
            
            day = day.split('T');
            day = day[0].split('-');
            if(day[2] == '01') {
				labels.push(String(day[2] + "/" + day[1]))
                data.push(jsonData[i][dataType])
                
            }
        }

		var ctx = document.getElementById(id).getContext('2d');
		var myChart = new Chart(ctx, {
			type: 'line',
			data: {
				labels: labels,
				datasets: [{
					label: id,
					data: data,
					backgroundColor: [
						'rgba(88, 81, 255, 0.9)',
						'rgba(54, 162, 235, 0.2)'
					],
					borderColor: [
						'rgba(186, 200, 255, 0.9)',
						'rgba(54, 162, 235, 1)'
					],
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
					}]
				}
			}
		});

	})
	
}

buildChart('chart1', 'totale_positivi');
buildChart('chart2', 'dimessi_guariti');
buildChart('chart3', 'deceduti');
buildChart('chart4', 'terapia_intensiva');