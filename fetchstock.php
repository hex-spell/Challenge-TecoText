<?php
include "./config.php";
$stock = [];
$stock_code = $_GET["stock_code"];

//preparo la consulta para que no se pueda hacer inyección de sql
$query = $link->prepare("SELECT * FROM STOCK_ARTICULOS WHERE `CODIGO` = ? ;");
//'i' indica que el campo es de tipo integer
$query->bind_param('i', $stock_code);

$query->execute();

if ($result = $query->get_result()) {


    while ($row = mysqli_fetch_assoc($result)) {
        array_push($stock, $row);
    }

    mysqli_free_result($result);
}

header('Content-Type: application/json');
echo json_encode($stock);
