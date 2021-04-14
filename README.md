# Weather Challenge

## Descrição

Você recebeu a tarefa de desenvolver algumas features para um site de previsão do tempo.

O site pega a previsão de uma API pública e exibe na tela. Hoje o MVP só mostra a previsão de uma cidade fixa, São Paulo, e em Fahrenheit.

## Histórias

A Análise de Negócios mapeou as seguintes histórias em ordem de prioridade:

### História 1
Mostrar as temperaturas também em graus Celsius. Só que a API só permite chamar um tipo de temperatura por vez, então vamos fazer nossa própria conversão.

### História 2
A pessoa poderá escolher de que cidade vai querer ver a previsão. Nem todo mundo mora em São Paulo, afinal de contas.

### História 3
Queremos ter um aplicativo para celular, e para isso precisamos pegar a previsão do nosso próprio site.

### História 4
Ao invés de sempre ter que procurar a cidade, as pessoas poderiam se registrar e adicionar e remover cidades favoritas.

## Instruções

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
