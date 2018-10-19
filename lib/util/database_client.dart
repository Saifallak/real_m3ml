import 'dart:async';
//import 'package:m3ml/model/user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:m3ml/model/user_model.dart';

class DatabaseClient {
  final FirebaseDatabase _databaseClient = FirebaseDatabase.instance;

//  DatabaseClient(this._databaseClient);
  Future<List<UserModel>> getUsersData() async {
    List<UserModel> _snappedUsers;
    DatabaseReference _dataRef = _databaseClient.reference().child("clients");
    await _dataRef.once().then((usersData) {
      List users = usersData.value;
      users.forEach((user) {
        _snappedUsers.add(UserModel.fromSnapShot(user));
      });
    });
    return _snappedUsers;
  }
}
