let stockCodeInput = document.getElementById("stock_code_input");

let stockTable = document.getElementById("stock_table");

let selectTable = document.getElementById("select_table");

let submitBtn = document.getElementById("submit");

// previene que el formulario se envie apretando enter, para dejar usar enter en el campo "codigo", para buscar items
window.addEventListener("keypress", function (event) {
  // Número 13 es la tecla "ENTER"
  const enterKeyCode = 13;
  if (event.key !== undefined && event.key === enterKeyCode) {
    event.preventDefault();
  } else if (event.keyCode !== undefined && event.keyCode === enterKeyCode) {
    event.preventDefault();
  }
});

function fetchStock(code) {
  return fetch(`/fetchstock.php?stock_code=${code}`);
}

// pequeña funcion que me permite crear y devolver un elemento html en una línea
// la uso como argumento de algunos appendChild()
function createHTMLElement(tag, innerHTML) {
  let newHTMLElement = document.createElement(tag);
  newHTMLElement.innerHTML = innerHTML;
  return newHTMLElement;
}

// igual que la anterior pero le podes pasar children en vez de innerHTML
function createHTMLElementWithChildren(tag, children) {
  let newHTMLElement = document.createElement(tag);
  newHTMLElement.appendChild(children);
  return newHTMLElement;
}

// crea un radiobutton con un event listener onclick, la uso para cambiar los datos de la tabla que muestra el item seleccionado
function createHTMLRadioWithClickListener(group, value, listener) {
  let newHTMLRadio = document.createElement("INPUT");
  newHTMLRadio.value = value;
  newHTMLRadio.name = group;
  newHTMLRadio.type = "radio";
  newHTMLRadio.addEventListener("click", listener);
  return newHTMLRadio;
}

// devuelve un input readonly, lo uso para la tabla que muestra el item seleccionado
function createHTMLReadOnlyInput(name, id) {
  let newHTMLInput = document.createElement("INPUT");
  newHTMLInput.id = id;
  newHTMLInput.name = name;
  newHTMLInput.type = "text";
  newHTMLInput.readOnly = "readonly";
  return newHTMLInput;
}

// una forma mas rápida de hacer los headers de una tabla, le paso un arreglo con los nombres y me genera el tr con sus respectivos th
function createTableHeaders(...headerNames) {
  let headers = document.createElement("TR");
  headerNames.forEach((headerName) => {
    headers.appendChild(createHTMLElement("TH", headerName));
  });
  return headers;
}

// evento que se ejecuta con los clicks de los radio buttons, setea los datos de la tabla de abajo
function setTableInputsData(item) {
  let codeInput = document.getElementById("codigo");
  let codGaciInput = document.getElementById("codgaci");
  let descriptionInput = document.getElementById("descripcion");
  codeInput.value = item.CODIGO;
  codGaciInput.value = item.CODGACI;
  descriptionInput.value = item.DESCRIPCION;
  submitBtn.disabled = false;
}

// genera la tabla usando los datos recibidos en json, pasados como argumento (stockData), stockTable es el elemento html en donde
// va a ser generada
function insertStockToTable(stockData, stockTable, selectTable) {
  stockTable.textContent = "";
  selectTable.textContent = "";
  if (stockData.length > 0) {
    let headers = createTableHeaders(
      "Elije",
      "Código",
      "CodGaci",
      "Descripción"
    );
    stockTable.appendChild(headers);
    stockData.forEach(function (item) {
      let content = document.createElement("TR");
      content.appendChild(
        createHTMLElementWithChildren(
          "TD",
          createHTMLRadioWithClickListener("codigo", item.CODIGO, () =>
            setTableInputsData(item)
          )
        )
      );
      content.appendChild(createHTMLElement("TD", item.CODIGO));
      content.appendChild(createHTMLElement("TD", item.CODGACI));
      content.appendChild(createHTMLElement("TD", item.DESCRIPCION));
      stockTable.appendChild(content);
    });
    stockTable.appendChild(createHTMLElement("TR", ""));
    // Desde acá para abajo creo la segunda tabla, que sirve de visualizacion de los datos seleccionados
    let viewTableHeaders = createTableHeaders(
      "Código",
      "CodGaci",
      "Descripción"
    );
    selectTable.appendChild(viewTableHeaders);
    let viewTableContents = document.createElement("TR");
    viewTableContents.appendChild(
      createHTMLElementWithChildren("TD", createHTMLReadOnlyInput("", "codigo"))
    );
    viewTableContents.appendChild(
      createHTMLElementWithChildren(
        "TD",
        createHTMLReadOnlyInput("codgaci", "codgaci")
      )
    );
    viewTableContents.appendChild(
      createHTMLElementWithChildren(
        "TD",
        createHTMLReadOnlyInput("descripcion", "descripcion")
      )
    );
    selectTable.appendChild(viewTableContents);
  } else {
    stockTable.innerHTML =
      "No se encontraron items con el código proporcionado";
  }
}

function handleCodeInputEnterKey() {
  fetchStock(stockCodeInput.value).then((res) =>
    res.json().then((data) => insertStockToTable(data, stockTable, selectTable))
  );
}

// event listener de apretar enter en el campo "Codigo", para obtener los items del stock
stockCodeInput.addEventListener("keypress", function (event) {
  // Número 13 es la tecla "ENTER"
  const enterKeyCode = 13;
  if (event.key !== undefined && event.key === enterKeyCode) {
    handleCodeInputEnterKey();
  } else if (event.keyCode !== undefined && event.keyCode === enterKeyCode) {
    handleCodeInputEnterKey();
  }
});
