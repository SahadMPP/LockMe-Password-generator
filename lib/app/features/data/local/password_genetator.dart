import 'dart:math';

import 'package:password_gen/app/features/domine/entities/password_settings.dart';

class PasswordGenerator {
  final Map<String,String> _characters = {
    "lowercase":"abcdefghijklmnopqrstuvwxyz",
    "uppercase":"ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    "numbers":"0123456789",
    "symbols":"!\$%&|[](){}:;.,*+-#@<>~",
  };

  String generatePassword(PasswordSettings passwordSettings){
    var staticPassword = "",ramdomPassword = "";

    if (passwordSettings.withLowerCase) {
      staticPassword += _characters['lowercase']!;
    }
    if (passwordSettings.withUpperCase) {
      staticPassword += _characters['uppercase']!;
    }
    if (passwordSettings.withNumber) {
      staticPassword += _characters['numbers']!;
    }
    if (passwordSettings.withSymbol) {
      staticPassword += _characters['symbols']!;
    }
    if (passwordSettings.includeSpaces) {
      staticPassword += " $staticPassword ";
    }

    for (var i = 0; i < passwordSettings.passwordLength; i++) {
      var randomChar = staticPassword[(Random().nextDouble() * staticPassword.length).floor()];
      if (passwordSettings.excludeDuplicate) {
        !ramdomPassword.contains(randomChar)|| randomChar == " " ? ramdomPassword += randomChar : i--;
      } else {
        ramdomPassword += randomChar;
      }
    }
    return ramdomPassword;
  }
}