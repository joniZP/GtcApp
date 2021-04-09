<?php

require_once("../GmailSender.php");


//SendVerificationMail("krsticnikola1999@gmail.com","Nikola Krstic","rwesfdrg");

 if($_SERVER["REQUEST_METHOD"] == "POST")
			  {
				 
					$vemail = $_POST['email'];
					$vkorisnickoime = $_POST['username'];
					$vpunoime = $_POST['fullname'];	
					$vtable = $_POST['table'];
					$vlink = "https://humanads.000webhostapp.com/GTCAPP/MyMailer/Verification/VerificationHandler.php?vuser=" . base64_encode($vkorisnickoime) ."&vemail=" . base64_encode($vemail) . "&vtable= " . base64_encode($vtable);
					$message = "<html><body><p>GTC App Vam zeli dobrodoslicu!</p><br /> <p>Za verifikaciju kliknite na dugme'Verifikuj'.</p><br /> <h1><a color = 'blue' href='{$vlink}'>Verifikuj</a></h1></body></html>";

					$vsubject = "Email Verification";
					SendVerificationMail($vemail,$vpunoime,$vsubject,$message);
							
			  }

?>