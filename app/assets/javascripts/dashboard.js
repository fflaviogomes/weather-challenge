
window.addEventListener("load", () => {

  f_buscaCidadeAjax(); //
  f_formAddFavAJAX();  // Event Listener: adicionar aos favoritos
  f_formSelfDestroy(); // Event Listener: remover dos favoritos

});

function f_buscaCidadeAjax() {

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

    //atualiza o Listener de adicionar cidade favorita após pesquisa;
    f_formAddFavAJAX();

  });

  eFormulario.addEventListener("ajax:error", () => {
    eAlvo.insertAdjacentHTML("afterbegin", erroBusca);
  });
}

function f_formAddFavAJAX(){

  const element = document.querySelector("form.form_addFavoriteCity");

  if(element){
    element.addEventListener("ajax:success", sucessoInsereCidadeFavorita);
    element.addEventListener("ajax:error",   erroInsereCidadeFavorita);
  }
}

function sucessoInsereCidadeFavorita(event) {

  const eAlvo = document.querySelector("#cidades_favoritas");
  
  const [_data, _status, xhr] = event.detail;

  eAlvo.innerHTML = xhr.response;

  //window.alert("'<%=@weather.city%>' adicionada às cidades favoritas!");
  window.alert("✔ Adicionada às cidades favoritas com sucesso!");

  //atualiza o Listener de remover cidade da listagem
  f_formSelfDestroy()

}

function erroInsereCidadeFavorita(event) { 
  //window.alert("Não foi possível adicionar '<%=@weather.city%>' às cidades favoritas. \n Registro duplicado? "); 
  window.alert("🛑 Não foi possível adicionar às cidades favoritas. \n Registro duplicado? "); 
}

function f_formSelfDestroy() {
  const forms = document.querySelectorAll("form.form_favoriteCity");
  forms.forEach((e) => {
    e.addEventListener("ajax:success", () => { e.remove(); });
  });
}
