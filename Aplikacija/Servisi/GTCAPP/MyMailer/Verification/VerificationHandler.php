<?php



		if($_SERVER["REQUEST_METHOD"] == "GET")
			  {
				  require_once "../../Database/gtcconfig.php";
				  $vuser = $_GET['vuser'];
				  $vemail = $_GET['vemail'];
				  $vtable = $_GET['vtable'];
				  $vemail = base64_decode($vemail);
				  $vuser = base64_decode($vuser);
				  $vtable = base64_decode($vtable);
				  $query = "UPDATE `{$vtable}` SET `Verifikovan`= 1 WHERE `KorisnickoIme` = '{$vuser}'";
				   if($stmt = mysqli_prepare($link, $query)){
						     if(mysqli_stmt_execute($stmt))
							 {
						      echo "<html><body><h1 align='center'>Uspesno potvrdjen mail!</h1><h2>KorisnickoIme: {$vuser}<br />Email: {$vemail}</h2></body></html>";
							 }
							 else
							 {
							  $status_code = 404;
							  $status_message = "Greska, proverite query!";
							 }
						  }
						  else
						  {
							  $status_code = 404;
							  $status_message = "Greska, proverite query!";
						  }
				  
			  }


?>