
window.addEventListener("load", () => {

  const eFormulario = document.querySelector("#formulario");
  const eAlvo = document.querySelector("#clima");
  const erroBusca = "<p>An error occurred while requesting data</p>";

  eFormulario.addEventListener("ajax:success", (event) => {
    const [_data, _status, xhr] = event.detail;
    //eFormulario.insertAdjacentHTML("afterbegin", xhr.responseText);
    //eAlvo.innerHTML = (xhr.responseText);

    var htmlResponse = new DOMParser().parseFromString(xhr.responseText, "text/html");
    //alert(); //querySelector("#clima").innerHTML);

    eAlvo.innerHTML = (htmlResponse.querySelector("#clima").innerHTML);
  });

  eFormulario.addEventListener("ajax:error", () => {
    eAlvo.insertAdjacentHTML("afterbegin", erroBusca);
  });
});