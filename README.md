

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
  autotextformatter: ^0.0.5
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
Use the package to automatically format text:

```dart
import 'package:flutter/material.dart';
import 'package:autotextformatter/autotextformatter.dart';

void main() {runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Autotextformatter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController descController = TextEditingController();
  late TextFormatter textAdjuster = TextFormatter(targetController: descController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TextFormField(
        controller: descController,
        maxLines: null,
        textInputAction: TextInputAction.newline,
        onChanged: (value) {
          textAdjuster.format();
        },
      ),
    );
  }
}
```

## Additional information
- Maintainer ([Amar khamkar](https://github.com/Amark19)) 
- License ([MIT](https://github.com/Amark19/autotextformatter/blob/master/LICENSE))
