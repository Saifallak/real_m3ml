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

  Future<Null> updateData(UserModel user) async {
    DatabaseReference _dataref =
        _databaseClient.reference().child("clients/${user.key}");
    await _dataref.update(user.toJson());
  }

  Future<Null> addData(UserModel user) async {
    if (await isReg(user.email) == true) {
      return throw Exception("user is already reg.");
    }
    DatabaseReference _dataref = _databaseClient
        .reference()
        .child("clients/${user.email.replaceAll(".", "_")}");
    await _dataref.update(user.toJson());
  }

  Future<Null> removeData(UserModel user) async {
    DatabaseReference _dataref =
        _databaseClient.reference().child("clients/${user.key}");
    await _dataref.remove();
  }

  Future<bool> isReg(String email) async {
    DatabaseReference _dataref =
        _databaseClient.reference().child("clients/$email");
    var x = await _dataref.once();
    return x.value == null ? false : true;
  }
}
