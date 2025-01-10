# Ventilation App

Authors: Felipe Azank dos Santos and Felipe Bagni in partnership with The World Health Organization

This is the repository of the Ventilator Calculator app, an app developted in flutter that helps people discovering the infection risks of their environments. The user must provide, as input, the dimensions of their room and windows and the app will then use their location to obtain the rest of the data necessary to estimate the ventilation and air change of the place. This is finally compared to World Health Organization guidelines and it informs if changes in ventilation should be done.

## How to run 

After setting up the necessary libraries to run a flutter application (if not, [access here the instalation guide](https://docs.flutter.dev/get-started/install)), it is possible to run the result by accessing the `ventilation_app` folder and running the following commands: 

```bash
flutter clean
```

```bash
flutter pub get
```

```bash
flutter run 
```

In addition in case you want to run all tests, you can run the following command: 

``` 
flutter test
```

or, if you want to run a specific test, you can run:

```
flutter test [PATH TO A SPECIFIC TEST]
```

## API Access

First, create an account on [OpenWeatherAPI](https://openweathermap.org/api) and follow the instructions to get your API Key.

Then, create a file in `/lib/` called `api_key.dart`. In the file, add just the following line substituting the `[API_KEY]` with yours.
 
`const String apiKey ='[API_KEY]';`

## Guidelines

The guidelines for the application were taken from the WHO document: "Roadmap to Improve and Ensure Good Indoor Ventilation in the Context of COVID-19" present [here](https://www.who.int/publications/i/item/9789240021280).

## Structure

The project follows the simple strcuture: 

```
ventilation_app/
├── .dart_tool/
├── android/
├── assets/
├── build/
├── coverage/
├── ios/
├── lib/
│   └── (main Dart files for the app logic)
├── linux/
├── macos/
├── test/
│   └── (unit and widget test files)
├── web/
├── windows/
├── .flutter-plugins
├── .flutter-plugins-dependencies
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── pubspec.lock
├── pubspec.yaml
└── README.md
```

With them being:
- *.dart_tool/*: Internal tools and dependencies used by Dart.
- *android/*: Files for building the Android version of the app.
- *assets/*: Folder for storing images, fonts, and other assets.
- *build/*: Auto-generated files during the build process.
- *coverage/*: Contains code coverage reports.
- *ios/*: Files for building the iOS version of the app.
- *lib/*: Main directory for app code, including the main.dart file.
- *linux/*: Files for building the Linux version of the app.
- *macos/*: Files for building the macOS version of the app.
- *test/*: Unit and widget test files for the app.
- *web/*: Files for building the web version of the app.
- *windows/*: Files for building the Windows version of the app.
- *pubspec.yaml*: Defines dependencies, assets, and configurations for the project.

