import 'dart:async';
//import 'package:m3ml/model/user.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseClient {
  final FirebaseDatabase _databaseClient = FirebaseDatabase.instance;

//  DatabaseClient(this._databaseClient);

  Future<bool> isUserRegistered(String email) async {
    bool status;
    try {
      DatabaseReference usersRef = _databaseClient
          .reference()
          .child("users/" + email.replaceAll(".", "_"));

      await usersRef.once().then((data) {
        status = data.value == null ? false : true;
      });
      return status;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addNewUser(User user) async {
    if(user.email == "") throw Exception("Email is empty");
    if (await isUserRegistered(user.email)) return false;

    DatabaseReference usersRef = _databaseClient
        .reference()
        .child("users/" + user.email.replaceAll(".", "_"));

    await usersRef.set(user.toJson());

    return true;
  }

  Future<User> getUserData(String email) async {
    if (!await isUserRegistered(email)) return null;

    User user;

    DatabaseReference usersRef = _databaseClient
        .reference()
        .child("users/" + email.replaceAll(".", "_"));

    await usersRef.once().then((snapshot) {
      user = User.fromSnapshot(snapshot);
    });

    return user;
  }

  Future<List<User>> getAllData() async {
    List<User> users = List<User>();

    DatabaseReference usersRef = _databaseClient.reference().child("users");
    await usersRef.once().then((snapshot) {
      users.forEach((use) => users.add(User.fromSnapshot(snapshot)));
    });
    users.forEach((u) => print(u));
    return users;
  }
}
