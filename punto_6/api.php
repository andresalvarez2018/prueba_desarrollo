<?php
session_start();
$server = "localhost";
$user = "root";
$pass = "";
$bd = "prueba";


$conexion = mysqli_connect($server, $user, $pass,$bd)
or die("Ha sucedido un error inexperado en la conexion de la base de datos");


 $sql = "SELECT 
 appx_employee.lastname AS apellido,
 appx_educationlevel.description
FROM
 appx_employee
     INNER JOIN
 appx_department ON appx_employee.department_id = appx_department.id
     INNER JOIN
 appx_educationlevel ON appx_educationlevel.id = appx_employee.educationlevel_id
     INNER JOIN
 (SELECT 
     appx_department.id, SUM(appx_employee.salary) AS salary
 FROM
     prueba.appx_employee
 INNER JOIN appx_department ON appx_department.id = appx_employee.department_id
 GROUP BY appx_department.id) AS dato_2 ON dato_2.id = appx_department.id
WHERE
 dato_2.salary > 3000000
ORDER BY apellido ASC;
";
     
mysqli_set_charset($conexion, "utf8"); //formato de datos utf8

if(!$result = mysqli_query($conexion, $sql)) die();

$registros = array(); //creamos un array

while($row = mysqli_fetch_array($result))
{
    $apellido=$row['apellido'];
    $description=$row['description'];
    
    $registros[] = array('apellido'=> $apellido,'description'=> $description);

}


$close = mysqli_close($conexion)
or die("Ha sucedido un error inexperado en la desconexion de la base de datos");




$json_string = json_encode($registros);
print($json_string);

?>


