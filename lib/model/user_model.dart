import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String key;
  String name;
  String email;
  String phone;

  UserModel();

  UserModel.fromSnapShot(DataSnapshot snapshot)
      : key = snapshot.key,
        name = snapshot.value["Name"],
        email = snapshot.value["Email"],
        phone = snapshot.value["Phone"];

  toJson() => {
    "name": name,
    "email": email,
    "phone": phone
  };

}
