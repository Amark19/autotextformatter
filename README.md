

# AutoTextFormatter

A Flutter package that automatically adds hyphen or increments numbers to the next line if the current line has one.

![flutter-pckg](https://github.com/Amark19/autotextformatter/assets/71604396/903cf1ff-c52e-4a81-861e-61feb3e16ff4)


## Features

Add this to your flutter app to:
- Enhance the text editor experience, similar to Google Keep or Google Docs.
- Automatically enable your text controller to add hyphens or numbering at the start of the line, improving the overall appearance of the text editor.

## Getting Started

To use the `autotextformatter` Flutter package, include it in your `pubspec.yaml` file:

```yaml
dependencies:
  autotextformatter: ^0.0.6
```

Run the following command to install the package:

```dart
flutter pub get
```

## Usage
Import the `autotextformatter` package in your Dart file:

```dart
import 'package:autotextformatter/autotextformatter.dart';
```
Following points are necessary to use this package :

1. Very first you need to have `TextEditingController` instance that has to be pass to TextFormatter constructor.
2. Then you can create instance of TextFormatter class to which you need to pass controller.
3. Here, you may need to use late keyword before initialization to avoid error `The instance member 'contoller' can't be accessed in an initializer` .

```dart
  TextEditingController descController = TextEditingController();
  late TextFormatter textAdjuster = TextFormatter(targetController: descController);
```

Use instance inside onChanged event of TextField, as text needs to be check everytime.

```dart
  TextFormField(
        controller: descController,
        maxLines: null,
        textInputAction: TextInputAction.newline,
        onChanged: (value) {
          textAdjuster.format();
        },
    );
```

## Additional information
- Maintainer ([Amar khamkar](https://github.com/Amark19)) 
- License ([MIT](https://github.com/Amark19/autotextformatter/blob/master/LICENSE))
