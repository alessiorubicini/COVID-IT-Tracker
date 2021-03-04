
google.charts.load('current', {
    'packages':['geochart'],
    'mapsApiKey': 'AIzaSyB8xsqazIL6sVtJvTg5g-5gUtF4d_P5f54'
});

google.charts.setOnLoadCallback(drawRegionsMap);

function drawRegionsMap() {
    var data = google.visualization.arrayToDataTable([
    	['Regione',   'Colore'],
    	['Sardegna', 0],
		['Calabria', 1],
		['Friuli Venezia Giulia', 1],
		['Lazio', 1],
		['Liguria', 1],
		['Puglia', 1],
		['Sicilia', 1],
		['Valle d\'Aosta', 1],
		['Veneto', 1],
		['Marche', 2],
		['Abruzzo', 2],
		['Campania', 2],
		['Emilia-Romagna', 2],
		['Lombardia', 2],
		['Piemonte', 2],
		['Toscana', 2],
		['P.A. di Bolzano', 2],
		['P.A. di Trento', 2],
		['Umbria', 2],
		['Basilicata', 3],
		['Molise', 3],
	]);

	var options = {
		region: 'IT', // Africa
          colorAxis: {
			  colors: ['white', 'yellow', 'orange', 'red'],
			  values: [0, 1, 2, 3]
			},
        backgroundColor: '#E9EFFF',
        datalessRegionColor: 'lightgray',
        defaultColor: '#f5f5f5',
		dataMode: 'markers',
    	resolution: 'provinces',
    	legend: 'none',
		width:'100%',
		height: 700,
    };

    var chart = new google.visualization.GeoChart(document.getElementById('region-colors'));
    chart.draw(data, options);

	// Paul Irish’s Debounced resize plug-in
	$(window).smartresize(function () {
		chart.draw(data, options);
	});
	
};