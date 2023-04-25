<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weather</title>
<link rel="stylesheet" href="resources/css/weatherAPI.css" />
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=n8k40j998a&submodules=geocoder"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>

	<div class="card">
		<div class="search">
			<input type="text" placeholder="도시명을 입력해주세요" spellcheck="false">
			<button>검색</button>
		</div>
		<div class="error">
			<p>도시명을 찾을 수 없습니다.</p>
		</div>
			<div class="weather">
				<img src="/resources/images/weather/loading.png" class="weather-icon">
				<h1 class="temp"></h1>
				<h2 class="city"></h2>
				<div class="details">
					<div class="col">
						<img src="/resources/images/weather/humidity.png">
						<div>
							<p class="humidity">50%</p>
							<p>습도</p>
						</div>
					</div>
					<div class="col">
						<img src="/resources/images/weather/wind.png">
						<div>
							<p class="windy">15km/h</p>
							<p>풍속</p>
						</div>
					</div>
				</div>
			</div>
			<div class="weather">
				<img src="/resources/images/weather/loading.png" class="weather-icon">
				<h1 class="temp">26°c</h1>
				<h2 class="city">서울</h2>
				<div class="details">
					<div class="col">
						<img src="/resources/images/weather/humidity.png">
						<div>
							<p class="humidity">50%</p>
							<p>습도</p>
						</div>
					</div>
					<div class="col">
						<img src="/resources/images/weather/wind.png">
						<div>
							<p class="windy">15km/h</p>
							<p>풍속</p>
						</div>
					</div>
				</div>
			</div>
			<div class="weather">
				<img src="/resources/images/weather/loading.png" class="weather-icon">
				<h1 class="temp">26°c</h1>
				<h2 class="city">서울</h2>
				<div class="details">
					<div class="col">
						<img src="/resources/images/weather/humidity.png">
						<div>
							<p class="humidity">50%</p>
							<p>습도</p>
						</div>
					</div>
					<div class="col">
						<img src="/resources/images/weather/wind.png">
						<div>
							<p class="windy">15km/h</p>
							<p>풍속</p>
						</div>
					</div>
				</div>
			</div>
			<div class="weather">
				<img src="/resources/images/weather/loading.png" class="weather-icon">
				<h1 class="temp">26°c</h1>
				<h2 class="city">서울</h2>
				<div class="details">
					<div class="col">
						<img src="/resources/images/weather/humidity.png">
						<div>
							<p class="humidity">50%</p>
							<p>습도</p>
						</div>
					</div>
					<div class="col">
						<img src="/resources/images/weather/wind.png">
						<div>
							<p class="windy">15km/h</p>
							<p>풍속</p>
						</div>
					</div>
				</div>
			</div>
			<div class="weather">
				<img src="/resources/images/weather/loading.png" class="weather-icon">
				<h1 class="temp">26°c</h1>
				<h2 class="city">서울</h2>
				<div class="details">
					<div class="col">
						<img src="/resources/images/weather/humidity.png">
						<div>
							<p class="humidity">50%</p>
							<p>습도</p>
						</div>
					</div>
					<div class="col">
						<img src="/resources/images/weather/wind.png">
						<div>
							<p class="windy">15km/h</p>
							<p>풍속</p>
						</div>
					</div>
				</div>
			</div>
	</div>

<script>
    let lon;
    let lat;
    $(function(){
    	checkAddress("양양")
    })
    function checkAddress(city){
        naver.maps.Service.geocode({
                address: city
            }, function(status, res) {
                if (status !== naver.maps.Service.Status.OK) {
                    return alert('Something wrong!');
                }
        
                var result = res.result, // 검색 결과의 컨테이너
                items = result.items; // 검색 결과의 배열
                lon = items[1].point.x;
                lat = items[1].point.y;

                checkWeather(lon, lat, city);
            }
        );
    }
    //async, await : 비동기식 코드를 동기식으로 표현하여 간단하게 나타내는 것.
    async function checkWeather(lon,lat, city){
    
        const apiKey = "80a42e54d066998bbe2a5c38181c7196";
        const apiUrl = "https://api.openweathermap.org/data/2.5/forecast?lat=";
     
        const weatherIcon = document.querySelector(".weather-icon");
        const response = await fetch(apiUrl +lat+`&lon=`+lon+ `&appid=`+apiKey);
        console.log(response);

        if(response.status == 404){
            document.querySelector(".error").style.display = "block";
            document.querySelector(".weather").style.display = "none";
        }else{
            var data = await response.json();
            console.log(data);
            const date = new Date();
            const hours = date.getHours();
            //3 6 9 12시 
            const compareHours = (Math.floor(hours / 3) * 3)+3;
            let num = 0;
            data.list.forEach((item) => {
                if (item.dt_txt.substr(11,2)==compareHours) {
                    const weather = $(".weather").eq(num);
      
                    const temp = Math.floor(item.main.temp - 273.15);
                    weather.find(".temp").text(temp+ "°c");
                    weather.find(".city").text(city);
                    const weatherIcon = weather.find(".weather-icon");
                    if(item.weather[0].main == "Clouds"){
                        weatherIcon.attr("src", "resources/images/weather/clouds.png") 
                    }else if(item.weather[0].main == "Clear"){
                        weatherIcon.attr("src", "resources/images/weather/clear.png")
                    }else if(item.weather[0].main == "Rain"){
                        weatherIcon.attr("src","resources/images/weather/rain.png")
                    }else if(item.weather[0].main == "Drizzle"){
                        weatherIcon.attr("src","resources/images/weather/drizzle.png");
                    }else if(item.weather[0].main == "Mist"){
                        weatherIcon.attr("src","resources/images/weather/mist.png");
                    }
                    weather.find(".humidity").text(item.main.humidity+ "%");
                    weather.find(".windy").text(item.wind.speed + "km/h");
                    num++;
                    console.log(num);
                };
           
            })

        }
    }
        const searchBox = document.querySelector(".search input");
        const searchBtn = document.querySelector(".search button");

        searchBtn.addEventListener("click", ()=>{
            checkAddress(searchBox.value);
        })
        
 </script>




</body>
</html>