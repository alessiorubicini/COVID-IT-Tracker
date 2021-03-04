
function formatNumber(num) {
	return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.')
}

function animateValue(id, start, end, duration) {
	const obj = document.getElementById(id);
  
	let startTimestamp = null;

	const step = (timestamp) => {
	  if (!startTimestamp) startTimestamp = timestamp;
	  const progress = Math.min((timestamp - startTimestamp) / duration, 1);
	  obj.innerHTML = Math.floor(progress * (end - start) + start);
	  if (progress < 1) {
		window.requestAnimationFrame(step);
	  }
	};

	window.requestAnimationFrame(step);
}
  

$.getJSON("https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-andamento-nazionale-latest.json")
.done(function( res ) {
	let data = res[0];

	document.getElementById("dateUpdate").innerHTML = String(data["data"]).replace("T", " ")

	//animateValue("positivi", 0, formatNumber(parseFloat(data["totale_positivi"])), 1);

	document.getElementById("positivi").innerHTML = formatNumber(parseFloat(data["totale_positivi"]));
	document.getElementById("guariti").innerHTML = formatNumber(parseFloat(data["dimessi_guariti"]));
	document.getElementById("deceduti").innerHTML = formatNumber(parseFloat(data["deceduti"]));
	document.getElementById("terapie").innerHTML = formatNumber(parseFloat(data["terapia_intensiva"]));
	document.getElementById("tamponi").innerHTML = formatNumber(parseFloat(data["tamponi"]));
	document.getElementById("totali").innerHTML = formatNumber(parseFloat(data["totale_casi"]));
	
});