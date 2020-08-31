# Weather Challenge

Esse desafio também está disponível em português pelo [link](https://github.com/bioritmo/weather-challenge/blob/master/README.md)  


## Goal

The challenge basically consists of reading a public weather forecast API and implementing some simple features.
The same challenge is used for different job opportunities.
Esse mesmo desafio é usado para três posições.
>- **Backend**: Implement all task described later without care about to Javascript, HTML, styles etc.  
>- **Frontend**: Implement only taks 1, 2 and 3. You should create a project from scratch. You should use the forecast API directly. You do not need to have a own backend server.
>You will receive a layout for the system.
>- **Fullstack**: Implement all task described later. You can implement the frontend on the same Ruby on Rails project or you can create a independent frontend project. However, be aware of documenting how to execute it. You will receive a layout for the system


## The Challenge

You received a task to develop some features to a weather forecast site.

The site takes the weather forecast from a public API and display it. Currently, this MVP only shows the weather forecast for a single city, São Paulo -SP, Brazil. Also, it only displays the temperature in Fahrenheit. 

The Business analyst requested you to develop some demands:

1. The site should show temperatures also in Celsius degree. However, the public API allows to request only on temperature format at time. Thus, you should implement your own conversion service.
2. The site should the user to choose the city he want to receive the weather forecast. After all, the system needs to support people from other cities as well.
3. The site should automatically select the user city, even though if it is an approximate solution based. This city should be selected by default. Please note that the user still able to select other city regarding the task 2.
4. The company also wants to have a mobile app that also displays the weather forecast consuming the data from our own web server.
5. In addition to search for cities, the site should allow the user to save and remove favorite cities.


## Technical details

At task 1, provide a class to convert the temperature. It receives it in Fahrenheit (F) and converts it to Celsius (C). Use it to display the temperature on the screen. The site should display both temperatures ( F and C).  

At task 2, include a search text field to allow the user to type the city name. You should send it to the API and display the weather forecast. You will receive a better evaluation if this action does not require page refreshing.

At task 3, get the user approximate city from some source (feel free to use some library or API) and uses it as default city to display the weather forecast.

At task 4, creates a public REST API endpoint that retrieves a weather forecast. The endpoint path is `/api/forecast?city=` and it responds with JSON format. It retrieves the same fields of the OpenWeatherMap API. You do not need to implement authentication mechanism on this endpoint.

At final task 5, create a data table 'favorite_cities' and design the solution from it. You can assume that there is only one user. You do not need to worry about users and authentication.

## Guide

* Look to conclude small steps. **Do not worry if you were not be able to conclude all tasks**. Use the available time to **show your code quality, your creativity and your solving-problem skills**.  
* We are going to evaluate your code by its quality, conformance to good practices. Be aware of the small details and error handling.
* If it was not possible to finish the task as you wish, you can add text notes or comments to your challenge explaining how you would finish it if you have more time. 
* The README should have detailed instructions of how to run and also how to generate data that may be needed to run the application.
* **You should not create Pull Requests on this project**. Instead, send us a link for your repository or a compressed file. 
* Create unit tests for model and services. Integration tests are a plus.
* Feel free to show your HTML/CSS skills. You can style the page as you want.
* Feel free to show your Javascript skills (using some JS framework/library or not). This is particularly important if the opportunity is a full-stack or frontend job. 
* Be aware of the rate limit of OpenWeatherMap API. It is a free account. You can configure your own account if you need to perform more requests.
* API Documentation: [Current weather data - OpenWeatherMap](https://openweathermap.org/current)
* If you have some doubt about this challenge or the hiring process, please, send us an email. 

## Running the application

### Using Docker

```shell
  docker-compose build
  docker-compose up
```

Open http://localhost:3000

### Without using Docker

```shell
  bin/rails server -p 3000
```

Open http://localhost:3000
