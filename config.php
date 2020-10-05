<?php
$link = mysqli_connect("localhost", "root", "", "tecotext");

if ($link === false) {
    die("ERROR: No se pudo conectar a la base de datos. " . mysqli_connect_error());
}
