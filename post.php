<?php
include "./config.php";
date_default_timezone_set('America/Argentina/Buenos_Aires');
$codigo = $_POST["codigo"];
$codvale = $_POST["codvale"];
$codgaci = $_POST["codgaci"];
$legajo = $_POST["legajo"];
$descripcion = $_POST["descripcion"];
$cantidad = $_POST["cantidad"];

$nombre = "";

//obtengo el nombre del usuario desde la otra tabla, no lo pude pasar desde el mismo select en el frontend
$query = $link->prepare("SELECT * FROM STOCK_LEGAJOS WHERE `LEGAJO` = ? ;");
//'i' indica que el campo es de tipo integer
$query->bind_param('i', $legajo);

$query->execute();

if ($result = $query->get_result()) {
    $nombre = mysqli_fetch_assoc($result)["NOMBRE"];
    mysqli_free_result($result);
}

$currentHour = date('H:i');

$query = mysqli_prepare($link, "INSERT INTO STOCK_VALES (CODIGO, CODGACI, DESCRIPCION, CANTIDAD, LEGAJO, NOMBRE, VALE, HORA) VALUES (?, ?, ?, ?, ?, ?, ?, ?) ;");
mysqli_stmt_bind_param($query, 'issiisis', $codigo, $codgaci, $descripcion, $cantidad, $legajo, $nombre, $codvale, $currentHour);

$query->execute();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vale posteado!</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <h1>Datos insertados con exito!</h1>
    <br>
    <table>
        <tr>
            <th>CODIGO</th>
            <th>CODGACI</th>
            <th>DESCRIPCION</th>
            <th>CANTIDAD</th>
            <th>LEGAJO</th>
            <th>NOMBRE</th>
            <th>VALE</th>
            <th>FECHA</th>
            <th>HORA</th>
        </tr>
        <?php
        $vales_query = "SELECT * FROM STOCK_VALES";
        if ($result = mysqli_query($link, $vales_query)) {
            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_array($result)) {
                    echo "<tr>";
                    echo "<td>" . $row["CODIGO"] . "</td>";
                    echo "<td>" . $row["CODGACI"] . "</td>";
                    echo "<td>" . $row["DESCRIPCION"] . "</td>";
                    echo "<td>" . $row["CANTIDAD"] . "</td>";
                    echo "<td>" . $row["LEGAJO"] . "</td>";
                    echo "<td>" . $row["NOMBRE"] . "</td>";
                    echo "<td>" . $row["VALE"] . "</td>";
                    echo "<td>" . $row["FECHA"] . "</td>";
                    echo "<td>" . $row["HORA"] . "</td>";
                    echo "</tr>";
                }
                mysqli_free_result($result);
            } else {
                echo "No se encontraron usuarios.";
            }
        } else {
            echo "ERROR: No se pudo ejecutar la consulta de usuarios. " . mysqli_error($link);
        }
        ?>
    </table>
</body>

</html>