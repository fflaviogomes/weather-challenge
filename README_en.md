# Weather Challenge

Esse desafio também está disponível em português pelo [link](https://github.com/bioritmo/weather-challenge/blob/master/README.md)  

## O Desafio

Você recebeu a tarefa de desenvolver algumas features para um site de previsão do tempo.

O site pega a previsão de uma API pública e exibe na tela. Hoje o MVP só mostra a previsão de uma cidade fixa, São Paulo, e em Fahrenheit.

A Análise de Negócios mapeou as seguintes histórias em ordem de prioridade:

1. Mostrar as temperaturas também em graus Celsius. Só que a API só permite chamar um tipo de temperatura por vez, então vamos fazer nossa própria conversão.
2. Ter uma pequena lista de cidades e permitir o usuário escolher de que cidade vai querer ver a previsão. Nem todo mundo mora em São Paulo, afinal de contas.
3. Obter a cidade do usuário automaticamente, mesmo que aproximado e deixar pré-escolhida como padrão.
4. Queremos ter um aplicativo para celular, e para isso precisamos pegar a previsão do nosso próprio site.
5. Ao invés de sempre ter que procurar a cidade, as pessoas poderiam se registrar e adicionar e remover cidades favoritas.


## Detalhes técnicos

Na história 1, faça uma classe para conversão de temperaturas. Ela recebe uma temperatura em Fahrenheit (F) e converte para Celsius (C). Use essa classe para exibir a temperatura na tela, ao lado da temperatura em Fahrenheit. 

Na história 2, coloque um campo de texto para passar o nome da cidade, repasse para a API, e mostre a previsão da cidade selecionada. Bônus se fizer sem que seja necessário recarregar a página.

Na história 3, obtenha a cidade aproximada do usuário de alguma forma (você pode escolher alguma biblioteca ou API
que te forneça essa informação) e mostre a previsão por padrão dessa cidade selecionada.

Na história 4, faça uma API pública REST para consulta da previsão. O endpoint será `/api/forecast?city=` e deverá retornar um JSON, com os mesmos campos retornados pela API do OpenWeatherMap. Não é necessário implementar autenticação da API.

Na história 5, crie uma tabela 'favorite_cities' e modele o banco a partir daí. Não precisa se preocupar com autenticação. Pode assumir que sempre haverá apenas um usuário.


## Orientações gerais

* Procure focar em pequenos entregáveis. Tem flexibilidade para escolher a ordem das entregas. **Tudo bem se não conseguir entregar tudo**. Use o tempo disponível **para apresentar a qualidade do seu código, sua criatividade e perícia em resolver problemas**. 
* Nós iremos avaliar a qualidade no código, as boas práticas e sua atenção com a qualidade na implementação. Tenha atenção aos detalhes e
busque tratar condições anormais de execução.
* Caso não seja possível finalizar as histórias da maneira como você gostaria (pode ser esperado de acordo com o prazo enviado). Você pode complementar seu desafio com um texto ou comentários de como teria implementado a solução caso tivesse mais tempo. 
* O README deverá ter instruções detalhadas de como rodar a aplicação e como gerar eventuais dados necessários a aplicação.
* Envie-nos um link para um repositório seu ou um arquivo ZIP com a sua solução. **Não abra PRs para este repositório.**
* Faça testes unitários para models e serviços. Testes de integração também são bem vindos.
* Se quiser mostrar suas habilidades em HTML/CSS, você pode estilizar a página como achar conveniente. Caso a vaga seja estritamente para trabalhar no backend, não precisa focar nessa parte.
* Se quiser mostrar suas habilidades em Javascript puro ou algum framework JS, fique à vontade. Isso é particularmente importante caso a vaga seja de full-stack ou frontend.
* Não abuse das chamadas à API do OpenWeatherMap, já que é uma conta free. Você pode configurar sua própria conta caso precise de mais chamadas. 
* Documentação da API: [Current weather data - OpenWeatherMap](https://openweathermap.org/current)
* Caso tenha alguma dúvida sobre esse desafio, você pode nos encaminhar via e-mail.
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
