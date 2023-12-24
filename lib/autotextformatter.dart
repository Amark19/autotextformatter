library autotextformatter;

import 'package:flutter/cupertino.dart';

/// A Calculator.
class TextFormatter {
  String currentText = "", previousText = "";
  late TextEditingController targetController ;
  TextFormatter({required TextEditingController targetController}) {
    this.targetController = targetController;
  }

   void format() {
    final value = targetController.value;
    final cursorPosition = targetController.selection.base.offset;
    final text = value.text;
    final selection = value.selection;
    final textList = text.substring(0, selection.extentOffset).split('\n');
    currentText =
        textList.length <= 1 ? textList[0] : textList[textList.length - 2];
    final trimmedTxt = currentText.trim();
    if (text.substring(0, selection.extentOffset).endsWith("\n")) {
      if (currentText.length > 0 &&
          (_checkForNumbersMatch(trimmedTxt) || trimmedTxt[0] == "-") &&
          text.length > previousText.length) {
        if (trimmedTxt[0] == "-") {
          final newCursorPosition =
              cursorPosition + _getStartSpacesInLine(currentText) + 1;
          _updateTargetController(
              targetController, text, selection, newCursorPosition, "-");
        } else if (_checkForNumbersMatch(trimmedTxt)) {
          String strNumbers = _getNumbersInStart(trimmedTxt);
          int numbers = strNumbers.length;
          final newCursorPosition = cursorPosition +
              (RegExp(r"^9+$").hasMatch(strNumbers.toString())
                  ? numbers + 1
                  : numbers) +
              _getStartSpacesInLine(currentText) +
              1;
          _updateTargetController(
              targetController,
              text,
              selection,
              newCursorPosition,
              "${int.parse(trimmedTxt.substring(0, numbers)) + 1}${trimmedTxt[numbers]}");
        }
      }
    }
    previousText = text;
  }

  int _getStartSpacesInLine(String txt) {
    int spaces = 0;
    for (int i = 0; i < txt.length; i++) {
      if (txt[i] == " ") {
        spaces++;
      } else {
        break;
      }
    }
    return spaces;
  }

  String _getNumbersInStart(String txt) {
    String strNumbers = "";
    for (int i = 0; i < txt.length; i++) {
      if (RegExp("[0-9]").hasMatch(txt[i])) {
        strNumbers += txt[i];
      } else {
        break;
      }
    }
    return strNumbers;
  }

  bool _checkForNumbersMatch(String txt) {
    return RegExp("^[0-9]+[)|.]").hasMatch(txt);
  }

  TextEditingValue _updateTargetController(
      controller, text, selection, newCursorPosition, value) {
    controller.value = TextEditingValue(
      text: text.substring(0, selection.extentOffset) +
          " " * _getStartSpacesInLine(currentText) +
          "$value" +
          text.substring(selection.extentOffset, text.length),
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );
    return controller.value;
  }
}
