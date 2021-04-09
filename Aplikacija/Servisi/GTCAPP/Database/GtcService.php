<?php
 
require_once "gtcconfig.php";

//$sql = "SELECT * From Users";


 if($_SERVER["REQUEST_METHOD"] == "POST")
			  {
					$status_code = 0;
					$status_message= "";
					$header="";
					$Data="";
					$query = $_POST['query'];
					
					$SelectOP = (!strcmp("SELECT",substr($query,0,6)) || !strcmp("select",substr($query,0,6)));
					//echo $SelectOP;
					
					if($SelectOP == 1)
					{
						if($result = $link->query($query))
						{
							
							while($kolona = $result->fetch_field())
							{
								$header = $header . ($kolona->name . "|");
							}

							while($row = $result->fetch_assoc()) {
							
									foreach($row as &$el)
									{
										$Data = $Data . $el;
										$Data= $Data . "|";
									}
									$Data = $Data . "##";
							}
						  $status_code = 200;
						  $status_message = "Zahtev uspesno obradjen.";
							
							
						}
						else
						{
							$status_code = 404;
							$status_message = "Podaci nisu dostupni!";
						}
						
						

						echo $status_code . "|";
						echo $status_message;
						echo "###";
						echo $header;
						echo "###";
						echo $Data;
						
					}
					else
					{
						  if($stmt = mysqli_prepare($link, $query)){
						     if(mysqli_stmt_execute($stmt))
							 {
						      $status_code = 200;
							  $status_message = "Uspesno izvrsen query!";
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
						echo $status_code . "|";
						echo $status_message;
						echo "###";
					}
			  }
			  
?>
	