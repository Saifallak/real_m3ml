import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:m3ml/helpers/localization_helper.dart';

///////////////////////////////// ENUMS ////////////////////////////////////////
//enum AccountType {
//  // Donator Account
//  Donator,
//  // Patient Account
//  Patient
//}

//enum Gender {
//  // Male Account
//  Male,
//  // Female Account
//  Female,
//  // Default Value
//  NotSpecified
//}

///////////////////////////// UserEmail CLASS //////////////////////////////////
//
//class UserEmail {
//  static String uEmail;
//}

/////////////////////////// Validations CLASS //////////////////////////////////
class Validation {
  // isValidEmail Returns null if it's valid
  // returns string if it's wrong
  static String isValidEmail(String email, BuildContext context) {
    try {
      Validate.isEmail(email);
    } catch (e) {
      return AppLocalizations.of(context).localize("Error.BadEmail");
    }
    return null;
  }

  // isValidPassword Returns null if it's valid
  // returns string if it's wrong
  static String isValidPassword(String password, BuildContext context) {
    if (password.length < 6)
      return AppLocalizations.of(context).localize("Error.BadPassword");

    return null;
  }

  // isValidHomeAddress Returns null if it's valid
  // returns string if it's wrong
  static String isValidHomeAddress(String homeAddress, BuildContext context) {
    if (homeAddress.length < 6)
      return AppLocalizations.of(context).localize("Error.BadHomeAddress");

    return null;
  }

  // isValidNotes Returns null if it's valid
  // returns string if it's wrong
  static String isValidNotes(String notes, BuildContext context) {
    if (notes.length < 6)
      return AppLocalizations.of(context).localize("Error.BadNotes");

    return null;
  }

  // isValidUsername Returns null if it's valid
  // returns string if it's wrong
  static String isValidUsername(String username, BuildContext context) {
    if ((username.length > 30) || (username.length < 3) || username.isEmpty) {
      return AppLocalizations.of(context).localize("Error.BadUsername");
    }
    try {
      Validate.isAlphaNumeric(username);
    } catch (e) {
      return AppLocalizations.of(context).localize("Error.BadUsername");
    }
    return null;
  }

  // isValidFullName Returns null if it's valid
  // returns string if it's wrong
  static String isValidFullName(String fullName, BuildContext context) {
    if ((fullName.length < 3) || fullName.isEmpty) {
      return AppLocalizations.of(context).localize("Error.BadFullName");
    }

    return null;
  }

  // isValidPatientType Returns null if it's valid
  // returns string if it's wrong
  static String isValidPatientType(String fullName, BuildContext context) {
    if ((fullName.length < 3) || fullName.isEmpty) {
      return AppLocalizations.of(context).localize("Error.BadPatientType");
    }

    return null;
  }

  // isValidAge Returns null if it's valid
  // returns string if it's wrong
  static String isValidAge(String age, BuildContext context) {
    if (age == null || age.isEmpty || (double.tryParse(age) == null)) {
      return AppLocalizations.of(context).localize("Error.BadAge");
    }

    return null;
  }

  // isValidNBlood Returns null if it's valid
  // returns string if it's wrong
  static String isValidNBlood(String nBlood, BuildContext context) {
    if (nBlood == null || nBlood.isEmpty || (double.tryParse(nBlood) == null)) {
      return AppLocalizations.of(context).localize("Error.BadNBlood");
    }

    return null;
  }

  // isValidPhone Returns null if it's valid
  // returns string if it's wrong
  // TODO : Better Way of checking Phone Number
  // we are just checking if numbers and if length
  static String isValidPhone(String phoneNum, BuildContext context) {
    if ((phoneNum.length != 11) || phoneNum.isEmpty) {
      return AppLocalizations.of(context).localize("Error.BadPhoneNum");
    }
    try {
      Validate.isAlphaNumeric(phoneNum);
    } catch (e) {
      return AppLocalizations.of(context).localize("Error.BadPhoneNum");
    }
    return null;
  }
}

///////////////////////////// THEMES CLASS /////////////////////////////////////
class Themes {
// TODO : Add theme for our App , so it will be easier to Manage
  static ThemeData kIOSTheme = new ThemeData(
    primarySwatch: Colors.red,
    primaryColor: Colors.red[100],
    primaryColorBrightness: Brightness.light,
  );

  static ThemeData kDefaultTheme = new ThemeData(
      primaryColor: Color(0xFFd50000),
      primaryColorLight: Color(0xFFff5131),
      primaryColorDark: Color(0xFF9b0000),
      accentColor: Colors.redAccent);
}
