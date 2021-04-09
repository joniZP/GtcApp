<?php
 $target = "upload/" . basename( $_FILES['image']['name']);  
// echo $target;
// echo $_FILES['image']['name'];
 if(move_uploaded_file($_FILES['image']['tmp_name'], $target))
 {
 	echo $target.'<br/>'."Uploaded";
 	} else {
 	echo "not Uploaded";
}
?>