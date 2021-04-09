<?php


		if($_SERVER["REQUEST_METHOD"] == "GET")
			  {
				
				  $vuser = $_GET['vuser'];
				  $vemail = $_GET['vemail'];
				  $vtable = $_GET['vtable'];
				  $vemail = base64_decode($vemail);
				  $vuser = base64_decode($vuser);
				  $vtable = base64_decode($vtable);
				  							  
			
				echo "<html>
                    <head>
                    </head>
                    <body>
                    <h1>Unesite podatke</h1>
                    <form method='POST'>
                        <p><input type='password' name='rpass' placeholder='Password'></p>
                        <p><input type='password' name ='rrpass' placeholder='Confirm password'><p>
                        <input  id='dugme' type='submit' value='Posalji'>
                    </form>
                    
                    
                    </body>

                    </html>";
				
				
			  }
			  else 	if($_SERVER["REQUEST_METHOD"] == "POST")
			  {
			      $vuser = $_GET['vuser'];
			      $vtable  =  $_GET['vtable'];
			      $vemail  =  $_GET['vemail'];
			       $vemail = base64_decode($vemail);
				   $vuser = base64_decode($vuser);
				   $vtable = base64_decode($vtable);
				  
			      $rpass =  $_POST['rpass'];
			      $rrpass =  $_POST['rrpass'];
			      
			      
			      
			      if(strlen($rpass) < 8 || strcmp($rpass,$rrpass) )//ne zadavoljava uslov
			        {
			            echo "<html>
                    <head>
                    </head>
                    <body>
                    <h1>Sifra mora biti veca ili jednaka 8 karaktera, sifre se moraju poklapati!</h1>
                    
                    <form method='POST'>
                        <p><input type='password' name='rpass' placeholder='Password'></p>
                        <p><input type='password' name ='rrpass' placeholder='Confirm password'><p>
                        <input  id='dugme' type='submit' value='Posalji'>
                    </form>
                    
                    
                    </body>

                    </html>";
			      
			        }
			        else
			        {
			             require "../../Database/gtcconfig.php";
			          $query = "UPDATE `{$vtable}` SET `Password`= '{$rpass}' WHERE `KorisnickoIme` = '{$vuser}'";
				   if($stmt = mysqli_prepare($link, $query)){
						     if(mysqli_stmt_execute($stmt))
							 {
						      echo "<html><body><h1 align='center'>Uspesno promenjena sifra!</h1><h2>KorisnickoIme: {$vuser}<br />Email: {$vemail}</h2></body></html>";
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
			        
			      
			  }
			  


?>

