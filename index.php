<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Evaluación php js</title>
  <link rel="stylesheet" href="styles.css">
</head>

<body>
  <?php
  include "./config.php";
  $codvale_query = "INSERT INTO STOCK_CODIGOS VALUES ()";
  if (mysqli_query($link, $codvale_query)) {
    $codvale = mysqli_insert_id($link);
  } else {
    die("ERROR: No se pudo generar número de vale. " . mysqli_error($link));
  } ?>

  <form action="/post.php" method="post" id="mainForm">
    <label for="codvale">Vale</label>
    <input type="text" name="codvale" id="codvale" readonly="readonly" value="<?php echo $codvale; ?>">
    <?php

    $users_query = "SELECT * FROM STOCK_LEGAJOS";
    if ($result = mysqli_query($link, $users_query)) {
      if (mysqli_num_rows($result) > 0) {
        echo "<label for='legajo'>Legajo</label>";
        echo "<select name='legajo' id='legajo'>";
        while ($row = mysqli_fetch_array($result)) {
          echo "<option value='" . $row["LEGAJO"] . "' >";
          echo $row["NOMBRE"];
          echo "</option>";
        }
        echo "</select>";
        mysqli_free_result($result);
      } else {
        echo "No se encontraron usuarios.";
      }
    } else {
      echo "ERROR: No se pudo ejecutar la consulta de usuarios. " . mysqli_error($link);
    } ?>
    <label for="stock_code">Código</label>
    <input type="text" id="stock_code_input">
    <table id="stock_table"> </table>
    <table id="select_table"> </table>
    <label for="stock_code">Cantidad</label>
    <input type="text" id="cantidad" name="cantidad">
    <input type="submit" value="Enviar" disabled id="submit">
  </form>
  <script src="/fetchstockjs.js"></script>

</body>

</html>