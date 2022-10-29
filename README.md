# SALT Flutter Coding Test

This project contain a simple Flutter App that shows top headline news from [newsapi.org](https://newsapi.org) that meant as a submission for SALT coding interview. This project was built using clean architecture pattern with BLoC state management. The following points describe what does the project contains.

#### Finished function

The following points denote what function are built in this app.

- View top headline news
- View news detail
- Visit news source using web view

#### Remaining works

The following points denote what part of the app that is still undone

- Bookmark news
- Load news without internet connection
- Adding unit test

### Getting Started

#### Clone this project

```
git clone git@github.com:abirajabi/salt_coding_challenge.git
```

#### Set Newsapi API KEY

This program use `flutter_dotenv` package/library to store the NewsAPI API key inside a .env file. To be
able successfully compile this project, please add a new file named .env in project root, then
add the following line of code:

```
NEWS_API_KEY=<ENTER YOUR API KEY HERE>
```

You can use the trial API KEY from newsapi.org: f47e02cca4ce4c448fc31fc88d61096b  
For further more information, kindly visit this [link](https://pub.dev/packages/flutter_dotenv).

#### Get dependencies and run the project

Please note that for this project I'm using flutter version 3.3.5 and dart version 2.18.2 with following gradle configuration:

```
minimumSdkVersion 19
compileSdkVersion 33
```

Run the following command to compile the project in the target device.

```
flutter pub get
flutter run
```

### Credit

Big thanks for Flutter clean architecture pattern article by [Reso Coder](https://resocoder.com/flutter-clean-architecture-tdd/).
