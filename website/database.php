<?php
	/*
	* database.php
	* This file contains an interface to the server's database
	*/

	ini_set('display_errors', '1');
	ini_set('display_startup_errors', '1');
	error_reporting(E_ALL);

	class Database {
		public $conn;
		public $host = "localhost";
		public $username = "alessiorubicini";
		public $password = "";
		public $database = "my_alessiorubicini";

		function __construct() {
			$this->conn = mysqli_connect($this->host, $this->username, $this->password, $this->database) or die('Impossibile connettersi al database');
			mysqli_set_charset($this->conn, "utf8");
		}

		public function query($query) {
			$query = strip_tags($query);

			$result = mysqli_query($this->conn, $query) or die('Database error in query: ' . mysqli_error($this->conn));

			return $result;
		}

		public function close() {
			$this->conn->close();
		}
		
	}

?>