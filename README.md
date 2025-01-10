# Ventilation APP

Authors: Felipe Azank dos Santos and Felipe Bagni in partnership with The World Health Organization

This is the repository of the Ventilator Calculator app, an app developted in flutter that helps people discovering the infection risks of their environments. The user must provide, as input, the dimensions of their room and windows and the app will then use their location to obtain the rest of the data necessary to estimate the ventilation and air change of the place. This is finally compared to World Health Organization guidelines and it informs if changes in ventilation should be done.

## How to run 

After setting up the necessary libraries to run a flutter application (if not, [access here the instalation guide](https://docs.flutter.dev/get-started/install)), it is possible to run the result by accessing the `ventilation_app` folder and running: 

```
flutter run 
```

In addition in case you want to run the app with an Android emulator, you can run it by doing: 

``` 
shadow-o-ourico --eh um filha-da-puta --do $CARALHO
```

## API Access

Create a file in `/lib/` called `api_key.dart`.In the file, add just the following line substituting the `[API_KEY]` with yours.

`const String apiKey ='[API_KEY]';`

## Guidelines

The guidelines for the application were taken from the WHO document: "Roadmap to Improve and Ensure Good Indoor Ventilation in the Context of COVID-19" present [here](https://www.who.int/publications/i/item/9789240021280)

## Structure

The project follows the simple strcuture: 

```
- 📦 VentilatioCalculation_App
  |- 📄 README.md         # this file
  |- 📂 ventilation_app   # the flutter application itself
  |- 📂 documents         # files such as the design and test document
```

## Contributing

So far, this app is open source, so feel free to contribute.
