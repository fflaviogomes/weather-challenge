# Weather Challenge

Bem vindo ao sistema Weather Challenge! 

O sistema Weather Challenge permite acesso rápido à situação atual do clima e tempo para várias cidades ao redor do mundo.

## Recursos do Sistema

* Pesquisa rápida para qualquer cidade, bastando informar o nome da mesma.
* Localização automática da cidade do usuário.
* Armazenamento de suas Cidades Favoritas para um consulta rápida, a um clique de distância.
* Exibe a temperatura em Graus Farenheit e Celsius, além de várias outras informações climáticas.

## Guia de uso

1. Ao acessar o sistema tentará localizar automaticamente a posição do usuário, seja por Geolocalização IP ou por outras capacidades do dispositivo.

2. Se o sistema não localizar corretamente, ou se desejar localizar outra cidade, poderá ser feita uma nova busca através do campo "Pesquisar cidade", e do botão "Enviar".

3. Após visualizar a previsão do clima o botão "⭐" permitirá guardar a cidade encontrada na lista de "Cidades Favoritas".

4. Para excluir uma cidade da lista de "Cidades Favoritas" basta clicar no botão "❌" próximo à cidade que deseja remover da lista e depois confirmar a sua escolha.

## Avançado

O sistema permite também acesso às informações via API no endpoint `/api/forecast?city=` ou `/api/forecast?latlon=`

* city="Nome da Cidade Desejada"
* latlon="latitude,longitude"

* * Latitude e Longitude devem ser informados como valor real, decimais separados por "." 
* * Latitude Leste representada por valores positivos; Oeste, negativo;
* * Longitude Norte representada por valores positivos; Sul, negativo;

## Instruções de instalação

### Docker

```shell
  docker-compose build
  docker-compose up
```

Acesse em http://localhost:3000

### Sem Docker

```shell
  bin/rails server -p 3000
```

Acesse em http://localhost:3000
