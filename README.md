<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Easy validator is a package that lets user to implement validation in any of the widget
that they create in flutter.

## Features

* Validate any widget in Flutter, not just form fields
* Simple integration with existing widgets
* Custom validation logic
* Automatic validation triggers
* Clean error message display

## Getting started

* Prerequisites
    Flutter SDK installed
    Basic knowledge of Flutter widgets and TextEditingController
* Installation
    Add this to you pubspec.yaml file
    dependencies:
        easy_validator: ^1.0.0

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

* Basic Validation
```dart
EasyValidator<String>(
  controller: myController,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  },
  child: TextField(
    controller: myController,
    decoration: InputDecoration(labelText: 'Username'),
  ),
)
```

* Custom Widget Validation
    Validate any widget by connecting it to a controller:
```dart
EasyValidator<int>(
  controller: _sliderController,
  validator: (value) {
    if (value == null || value < 10) {
      return 'Value must be at least 10';
    }
    return null;
  },
  child: Slider(
    value: _currentValue,
    min: 0,
    max: 100,
    onChanged: (value) {
      _sliderController.text = value.toString();
    },
  ),
)
```

## Additional information

This package was created to solve the limitation of Flutter's built-in validation system which primarily works with Form widgets. Easy Validator brings validation capabilities to any widget in your Flutter application.
