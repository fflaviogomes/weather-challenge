window.addEventListener("load", () => {

  //Teste da API de localização. Endpoint: /api/forecast; Parâmetros: city="cidade" ou latlon="lat,lon";
  //buscaCidadeLatLonAPI();

});

function buscaCidadeLatLonAPI() {

  if ('geolocation' in navigator) {
    navigator.geolocation.getCurrentPosition(buscaCidadeJSON, errBuscaCidadeJSON);
  }

  function buscaCidadeJSON(p) {

    var crd = p.coords;

    var myURL = "/api/forecast";

    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");


    //var postData = { city:   'banana' };
    //var postData = { city:   'guarulhos' };
    //var postData = { latlon: '-23.44,-46.54' };
    var postData = { latlon: `${crd.latitude},${crd.longitude}` };

    var myInit = {
      method: 'POST',
      headers: myHeaders,
      //mode: 'cors',
      //cache: 'default',
      body: JSON.stringify(postData)
    };

    var myRequest = new Request(myURL, myInit);

    //var apiKey = '3af12266e2913e9347cee2db36b37fe3';
    //var fetchURL = `https://api.openweathermap.org/geo/1.0/reverse?lat=${crd.latitude}&lon=${crd.longitude}&limit=1&appid=${apiKey}`;
    //Fetch ~> Response ~> Update
    fetch(myRequest).then(response => response.json()).then(d => console.log(d));

  }

  function errBuscaCidadeJSON(err) {
    console.warn(`Erro na busca JSON: (${err.code}): ${err.message}`);
  }

}
