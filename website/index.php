<?php
	ini_set('display_errors', '1');
	ini_set('display_startup_errors', '1');
	error_reporting(E_ALL);
	require_once('database.php');
?>

<!DOCTYPE html>
<html lang="it">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<meta property="og:title" content="COVID Italy Tracker"/>
	<meta property="og:url" content="http://alessiorubicini.altervista.org/COVID-Tracker/index.php" />
	<meta property="og:description" content="Un sito web per tracciare gli ultimi numeri e provvedimenti sul COVID-19 in Italia" />
	<meta property="og:image" content="images/ogimage.png"/>
	
	<link rel="icon" href="images/covid-icon.png">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/footer.css">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

	<title>COVID-IT tracker</title>
</head>

<body style="background-color: #E9EFFF;">

	<div class="container">

		<header style="margin-top: 20px;">

			<div class="row">
				<div class="col-sm-1">
					<img class="mx-auto d-block" src="images/covid-icon.png" width="70" height="70">
				</div>
				<div class="col-sm-11">
					<h2>COVID-IT tracker</h2>
					<h5>Sviluppato da Alessio Rubicini</h5>
				</div>
			</div>
			
		</header>

		<ul class="nav nav-pills nav-fill nav-justified" id="pills-tab" role="tablist" style="margin-top: 20px;">
			<li class="nav-item" role="presentation">
				<a class="nav-link active" id="pills-profile-tab" data-toggle="pill" href="#dati" role="tab" aria-controls="pills-profile" aria-selected="false">Dati</a>
			  </li>
			  <li class="nav-item" role="presentation">
				<a class="nav-link " id="pills-colors-tab" data-toggle="pill" href="#colori" role="tab" aria-controls="pills-home" aria-selected="true">Regioni</a>
			  </li>
			<li class="nav-item" role="presentation">
			  <a class="nav-link " id="pills-home-tab" data-toggle="pill" href="#decreti" role="tab" aria-controls="pills-home" aria-selected="true">Normativa</a>
			</li>
			<li class="nav-item" role="presentation">
				<a class="nav-link " id="pills-home-tab" data-toggle="pill" href="#app" role="tab" aria-controls="pills-home" aria-selected="true">App</a>
			</li>
		</ul>
		
		
		<div class="tab-content" id="pills-tabContent" style="margin-bottom: 50px;">

			<div class="tab-pane fade show active" id="dati" role="tabpanel" aria-labelledby="pills-profile-tab">

				<h2 class="text-center" style="margin: 40px;">Ultimo aggiornamento<br><span id="dateUpdate"></span></h2>
	
				<div class="row" style="margin-top: 20px;">
					<div class="col-sm-4">
						<div class="customCard">
							<h3 id="positivi">-</h3>
							<h5>positivi</h5>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="customCard">
							<h3 id="guariti">-</h3>
							<h5>guariti/dimessi</h5>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="customCard">
							<h3 id="deceduti">-</h3>
							<h5>deceduti</h5>
						</div>
					</div>
				</div>
	
				<div class="row">
					<div class="col-sm-4">
						<div class="customCard">
							<h3 id="terapie">-</h3>
							<h5>terapie intensive</h5>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="customCard">
							<h3 id="tamponi">-</h3>
							<h5>tamponi</h5>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="customCard">
							<h3 id="totali">-</h3>
							<h5>casi totali</h5>
						</div>
					</div>
				</div>

				<div class="row" style="margin-top: 100px;">
					<div class="col-sm-6">
						<div class="customCard customChart">
							<h2 style="padding: 20px;">Positivi</h2>
							<canvas id="chart1" width="400" height="400"></canvas>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="customCard customChart">
							<h2 style="padding: 20px;">Guariti / Dimessi</h2>
							<canvas id="chart2" width="400" height="400"></canvas>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="customCard customChart">
							<h2 style="padding: 20px;">Deceduti</h2>
							<canvas id="chart3" width="400" height="400"></canvas>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="customCard customChart">
							<h2 style="padding: 20px;">Terapie intensive</h2>
							<canvas id="chart4" width="400" height="400"></canvas>
						</div>
					</div>
				</div>
	
			</div>

			<div class="tab-pane fade show" id="colori" role="tabpanel" aria-labelledby="pills-profile-tab">

				<div style="margin-top: 20px;">
					<h4>Dati aggiornati al 4 marzo 2021</h4>

					<ul class="list-group" style="margin-bottom: 30px;">
						<?php
							$db = new Database();
							$result = $db->query("SELECT * FROM Regioni ORDER BY colore ASC;");

							while($row = mysqli_fetch_array($result)) {
								$colore = "";

								if($row["colore"] == 'Bianco') {
									$colore = "light\"";
								} else if($row["colore"] == 'Giallo') {
									$colore = "warning\"";
								} else if($row["colore"] == 'Arancione') {
									$colore = "\" style=\"background-color: orange;\"";
								} else {
									$colore = "danger\"";
								}

								echo '<li class="list-group-item">' . $row["nome"] . ' <span class="badge badge-' . $colore. '>' . $row["colore"] . '</span></li>';
							}
						?>
					</ul>

					<div id="region-colors"></div>
				</div>
				

			</div>
			
			<div class="tab-pane fade " id="decreti" role="tabpanel" aria-labelledby="pills-home-tab">

				<div class="row" style="margin-top: 20px;">
					<div class="col-sm-12">
						<h2>Prossimo decreto</h2>
						<div class="list-group-item list-group-item-action" style=" box-shadow: 0 14px 28px #cbd8fd, 0 10px 10px #cbd8fd; border-radius: 10px;">
							<div class="d-flex w-100 justify-content-between">
							  <h5 class="mb-1">Decreto marzo</h5>
							</div>
							<p class="mb-1">Firma: 02/03/2021</p>
							<p class="mb-1">Entrata in vigore: 06/03/2021</p>
							<p class="mb-1">Termine validità: 06/04/2021</p>
							<a class="mb-1" href="https://www.governo.it/it/articolo/covid-19-il-presidente-draghi-firma-il-nuovo-dpcm/16343" target="_blank">Pagina ufficiale</a>
						</div>
					</div>
				</div>
		
				<div class="row" style="margin-top: 20px;">
					<div class="col-sm-12">

						<div style="margin-top: 20px;">
							<h2>Consulta database regole</h2>
							<div>
								<select class="custom-select" id="region-select" style="margin-top: 10px;">
									<option selected>Inserisci la tua regione</option>
									<?php
										$db = new Database();
										$result = $db->query("SELECT * FROM Regioni ORDER BY nome ASC;");

										while($row = mysqli_fetch_array($result)) {
											echo '<option value="' . $row["nome"] . '">' . $row["nome"] . '</option>';
										}
									?>
								</select>

								<select class="custom-select" id="field-select"  style="margin-top: 10px;">
									<option selected>Scegli un campo</option>
									<option value="Scuola">Scuola</option>
									<option value="VisiteAmiciParenti">Visite ad amici e parenti</option>
									<option value="BarRistoranti">Bar e ristoranti</option>
									<option value="Negozi">Negozi</option>
									<option value="Musei">Mostre e musei</option>
									<option value="Sport">Sport</option>
								</select>

								<button type="button" onclick="checkRules();" class="btn btn-primary" style="background-color: #5751FF; margin-top: 10px;">Procedi</button>

							</div>
						</div>

						<div class="alert alert-primary" role="alert" id="search-result" style="margin-top: 20px; display: none;">
							
						</div>
					</div>
				</div>


			</div>

			<div class="tab-pane fade" id="app" role="tabpanel" aria-labelledby="pills-profile-tab">

				<img class="img-fluid text-center " src="images/app_clean.png" style="padding: 30px;">

				<p class="text-center">L'app iOS di COVID-IT Tracker è sviluppata con tecnologie native e, come il presente sito web, usufruisce
					dei dati ufficiali della Protezione Civile e della Presidenza del Consiglio dei Ministri. L'app inoltre fornisce dati sulle vaccinazioni
					e le ultime notizie in merito alla pandemia oltre che a una scheda completa dello stato attuale di ogni regione. Per maggiori informazioni
					contattare lo sviluppatore cliccando sul link in fondo alla pagina.
				</p>

			</div>

		</div>

		
	</div>

	<div class="footer-basic">
        <footer>
			<!--
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>-->
			<img class="mx-auto d-block" src="images/covid-icon.png" width="50" height="50">
            <p class="copyright">Copyright <a href="http://alessiorubicini.altervista.org">Alessio Rubicini</a> © 2021</p>
			<div class="copyright text-center">Icon made by <a href="https://www.flaticon.com/authors/eucalyp" title="Eucalyp">Eucalyp</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
        </footer>
    </div>

	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	<script src="js/debounce.js"></script>
	
	<script src="js/loadData.js"></script>
	<script src="js/buildChart.js"></script>
	<script src="js/buildMap.js"></script>
	<script src="js/checkRules.js"></script>
	
</body>

</html>