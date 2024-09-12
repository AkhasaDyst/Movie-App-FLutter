# Movie App
Movie Database App using **TMDB** API and **Flutter**
<br>
<img src="https://raw.githubusercontent.com/AkhasaDyst/Movie-App-Flutter/master/assets/images/screen/movie_home.png" width="254"/>
<img src="https://raw.githubusercontent.com/AkhasaDyst/Movie-App-Flutter/master/assets/images/screen/movie_detail.png" width="254"/>

## API TMDB
![API URL](https://raw.githubusercontent.com/AkhasaDyst/Movie-App-Flutter/master/assets/images/screen/url.png)
Using the **[The Movie Database](https://www.themoviedb.org/)** to show movie list depend on Popularity, Newest, and Top Rated
<br>
![Popular](https://raw.githubusercontent.com/AkhasaDyst/Movie-App-Flutter/master/assets/images/screen/url-1.png)
![Now Playing](https://raw.githubusercontent.com/AkhasaDyst/Movie-App-Flutter/master/assets/images/screen/url-2.png)
![Top Rated](https://raw.githubusercontent.com/AkhasaDyst/Movie-App-Flutter/master/assets/images/screen/url-3.png)

## Clean Architecture
![Clean Architecture](https://raw.githubusercontent.com/AkhasaDyst/Movie-App-Flutter/master/assets/images/screen/cleanarch.png)
![Structure Code](https://raw.githubusercontent.com/AkhasaDyst/Movie-App-Flutter/master/assets/images/screen/structure.png)
Clean Architecture separate on 3 layer, Presentation, Domain, and Data. This lead to the codebase more maintainable and allows for easier updates or changes to specific components without affecting the entire application.
<br>

## BLoC - State Management
![Clean Architecture](https://raw.githubusercontent.com/AkhasaDyst/Movie-App-Flutter/master/assets/images/screen/bloc.png)
**BLoC (Business Logic Components)** provides good documentation about different scenarios. It separates the business logic from the code, thus making the code understandable. Using BLoC makes the outcome more testable. It is easy to keep track of different states that occur during product development.

My Bloc is used when retrieve data movie popular, now playing and top rated, on one screen, so it will change when the state changed
<br>

## CI/CD
![CI/CD](https://raw.githubusercontent.com/AkhasaDyst/Movie-App-Flutter/master/assets/images/screen/cicd.png)
[CI/CD using Github Action](https://github.com/AkhasaDyst/Movie-App-Flutter/actions)
<br>

## Release app build (.apk)
![Release APK](https://raw.githubusercontent.com/AkhasaDyst/Movie-App-Flutter/master/assets/images/screen/apk.png)
[Release APK](https://github.com/AkhasaDyst/Movie-App-Flutter/actions/runs/10828395351)
<br>





