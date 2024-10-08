# Golden Quran  Project

A Golden Quran  project created in flutter using  Provider.Golden Quran is an innovative mobile application designed to enhance the experience of reading and interacting with the Quran. This project provides users with an intuitive interface that allows for seamless navigation through the verses, offering features like audio recitation, translations in multiple languages, and some ahadeth, clone the appropriate branche mentioned below:

* For Mobile: https://github.com/mohammedashraf16/Islami_App

## Getting Started

The Golden Quran contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

![islami_dark](https://github.com/user-attachments/assets/ad478450-47bd-49fa-9533-e33f3ff648fb)

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
  https://github.com/mohammedashraf16/Islami_App
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```



## Golden Quran Features:

* Splash
* Home
* Routing
* Theme
* Localozation
* Provider (State Management)
* Api

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- features/
|- constants/
|- l10n/
|- generated/
|- widgets/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `preferences` and `strings`.
4- features  — Contains all the ui of your project, contains sub directory for each screen.
5- l10n — Contains two files, one file containing all the words related to the application to be translated into arabic and the other into enelish
6- widgets — Contains the common widgets for your applications. For example, Button, TextField etc.
8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- my_app_theme.dart
|- strings.dart
|- assets.dart
```
### Packages 
```
Packages /
|- flutter_native_splash
|- google_fonts
|- provider
|- shared_preferences
|- flutter_localizations
|- intl
|- http
|- audioplayers
```
### Samples Of Ui:
###### In Dark Mode

  ![islami_dark](https://github.com/user-attachments/assets/ad478450-47bd-49fa-9533-e33f3ff648fb)
  
 ###### In Dark Mode
 
 ![islami_light](https://github.com/user-attachments/assets/8e8c70b5-d925-480e-b782-0fa1196cc1d2)

       
## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the Islami then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architectured for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
