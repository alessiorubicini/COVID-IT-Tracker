

function checkRules() {

	let region = document.getElementById("region-select").value;
	let field = document.getElementById("field-select").value;

	if(region == "Inserisci la tua regione" || field == "Scegli un campo") {
		return
	}

	console.log(region + " " + field)

	$.ajax(
		{
			url: 'checkRules.php',
        	data: {region: region, field: field},
        	type: 'POST',
        	success: function(output) {
				console.log(output)
                let result = document.getElementById("search-result");
				result.style.display = "flex";
				result.innerHTML = output
        	}
		}
	);

}