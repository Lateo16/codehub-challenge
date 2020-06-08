# article-reader

A flutter based mobile application that users can use to read articles



## Getting Started
- clone the project
- cd into the project directory
- enter the command "flutter pub get"
- enter the command "flutter run" to start the application

### How the system works
The app is divided into two sections
- The models section that consist of the Article and Articles classes (found in the article.dart and articles.dart files respectively ).
- And the view section made up of the MyApp and ReadNews classes (in main.dart and read_news.dart files respectively).
- The Articles class defines a model that represents data been read from the api end point.
- The Article class also defines a model that represents data corresponding to a particular article read from the api end point.
- In the MyApp class the http package is used to perform a get request to the api and the response data is rendered as a view using a widget called ListView builder by wrapping each article with the listTile widget.
- Before the request is made a circular progress bar is displayed and on a successful request the data retrieved is rendered.
- Once an article's ListTile widget is tapped, the app navigates to a new screen rendering the contents of the article.
- This rendering is possible because of the ReadNews class which renders these contents by using data acce pted through its constructor during navigation from the MyApp screen to ReadNews screen ( this is when you are trying to read a specific article.)

### app screen
<img src="./images/articles-list.png">

### link to screen recording of app
<a href="https://drive.google.com/file/d/1gmBfllHHv6v885DalVCaUl_gcgAeBs4t/view?usp=sharing">Screen recording</a>

