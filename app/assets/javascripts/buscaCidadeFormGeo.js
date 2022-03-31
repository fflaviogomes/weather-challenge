window.addEventListener("load", () => {

  if ('geolocation' in navigator) {
    navigator.geolocation.getCurrentPosition(buscaCidadeFormGeo, errBuscaCidadeFormGeo);
  }

  function buscaCidadeFormGeo(p) {

    var crd = p.coords;
    var apiKey = '3af12266e2913e9347cee2db36b37fe3';
    var fetchURL = `https://api.openweathermap.org/geo/1.0/reverse?lat=${crd.latitude}&lon=${crd.longitude}&limit=1&appid=${apiKey}`;

    //Fetch ~> Response ~> Update
    fetch(fetchURL).then(response => response.json()).then(atualizaFormGeo);

  }

  function errBuscaCidadeFormGeo(err) {
    console.warn(`Erro na busca da Localização: (${err.code}): ${err.message}`);
  }

  function atualizaFormGeo(d) {

    var i = document.querySelector("#f_cidade");

    //Busca a cidade
    i.value = d[0].name;

    //i.form.submit();
    i.form.querySelector("[type=submit]").click();

  }

});