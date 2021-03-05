<?php
	require_once('database.php');
	$db = new Database();
	
	$regione = $_POST["region"];
	$campo = $_POST["field"];

	$query = "SELECT * FROM Regioni R, Zone Z, Prevede P, Regole WHERE R.nome = '$regione' AND R.colore = Z.colore AND Z.id = P.idZona AND P.idRegola = Regole.id AND Regole.campo = '$campo'";

	$result = $db->query($query);

	while($row = mysqli_fetch_array($result)) {
		echo "Zona colore " . strtolower($row["colore"]) . ": ". $row["descrizione"];
	}

?>

