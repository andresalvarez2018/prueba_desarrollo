<?php
$cantidad=6;
$array = Array();

if ($cantidad == 0) {
    echo "Error el tamaño de matriz tiene que ser mayor a 0";
}else { 
    for ($i=0; $i <  $cantidad; $i++) { 
        array_push($array,array());
    }

    for ($i=0; $i < $cantidad ; $i++) { 
        
        for ($q=0; $q < $cantidad; $q++) { 
            $x = $i + 1;
            if(($i==$q)  ||  ($q == ($cantidad - $x))){            
                echo "X";
            }
            else{           
                echo "-";          
            }
        }
        echo "<br>";
    }  
}

?>