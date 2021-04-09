<?php

require ("../GmailSender.php");


 if($_SERVER["REQUEST_METHOD"] == "POST")
			  {
				    
					$vemail = $_POST['email'];
					$vkorisnickoime = $_POST['username'];
					$vpunoime = $_POST['fullname'];	
					$vtable = $_POST['table'];
					$vlink = "https://humanads.000webhostapp.com/GTCAPP/MyMailer/ForgotPassword/ForgotPasswordHandler.php?vuser=" . base64_encode($vkorisnickoime) ."&vemail=" . base64_encode($vemail) . "&vtable= " . base64_encode($vtable);
					
					$message = "<html><body><p>GTC App</p><br /> <p>Za resetovanje lozinke kliknite na dugme'Resetuj'.</p><br /> <h1><a color = 'blue' href='{$vlink}'>Resetuj</a></h1></body></html>";
                    $vsubject = "Reset Password";
					SendVerificationMail($vemail,$vpunoime,$vsubject,$message);
					echo "Uspesno!";
							
			  }

?>