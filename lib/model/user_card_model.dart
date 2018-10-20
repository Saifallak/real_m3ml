import 'package:m3ml/model/user_model.dart';
import 'package:m3ml/util/auth_client.dart';
import 'package:m3ml/util/database_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CardModel extends StatefulWidget {
  @override
  _CardModelState createState() => _CardModelState();
}

class _CardModelState extends State<CardModel> {
//  String bloodTypeIMG = "";

  var profPic;
  // Database Object
  DatabaseClient _databaseClient = DatabaseClient();

  AuthClient _authClient = AuthClient.internal();

  UserModel _user = UserModel();

//  @override
//  void initState() {
//    super.initState();
//    _retrieveUserData();
//  }

//  _retrieveUserData() async {
//    FirebaseUser user = await _authClient.isLoggedIn();
//    _user = await _databaseClient.getUserData(user.email);
//    print(_user.email);
//    print(_user.fullName);
//    print(_user.bloodType);
//    print(_user.phoneNum);
//    print(_user.age);
//    print(_user.profURL);
//    print(_user.dentist);
//    print(_user.diseases);
//    print(_user.gender);
//    print(_user.homeAddress);
//    print(_user.social);
//    print(_user.notes);
////    getProfPic();
////    getBloodType();
//  }

//  Widget getBloodType() {
//    if (_user.bloodType == null)
//      return Image.asset("assets/images/O-.png");
//    else if (_user.bloodType == "O-")
//      return Image.asset("assets/images/O-.png");
//    else if (_user.bloodType == "O+")
//      return Image.asset("assets/images/o.png");
//    else if (_user.bloodType == "A-")
//      return Image.asset("assets/images/a-.png");
//    else if (_user.bloodType == "A+")
//      return Image.asset("assets/images/a.png");
//    else if (_user.bloodType == "B-")
//      return Image.asset("assets/images/b-.png");
//    else if (_user.bloodType == "B+")
//      return Image.asset("assets/images/b.png");
//    else if (_user.bloodType == "AB-")
//      return Image.asset("assets/images/ab-.png");
//    else if (_user.bloodType == "AB+")
//      return Image.asset("assets/images/ab.png");
//    else
//      return Image.asset("assets/images/O-.png");
//  }

//  Widget getBloodType() {
//    if (_user.bloodType == null) return Image.asset("assets/images/O-.png");
//
//    switch (_user.bloodType) {
//      case "O-":
//        return Image.asset("assets/images/O-.png");
//        break;
//      case "O+":
//        return Image.asset("assets/images/o.png");
//        break;
//      case "A-":
//        return Image.asset("assets/images/a-.png");
//        break;
//      case "A+":
//        return Image.asset("assets/images/a.png");
//        break;
//      case "B-":
//        return Image.asset("assets/images/b-.png");
//        break;
//      case "B+":
//        return Image.asset("assets/images/b.png");
//        break;
//      case "AB-":
//        return Image.asset("assets/images/ab-.png");
//        break;
//      case "AB+":
//        return Image.asset("assets/images/ab.png");
//        break;
//      default:
//        Image.asset("assets/images/O-.png");
//        break;
//    }
//  }

//  getProfPic() {
//    _user.profURL == null
//        ? profPic = Image.asset("assets/images/avatarBoy.png")
//        : profPic = Image.network(_user.profURL);
//  }

  Widget getProfPic() {
    return Image.asset("assets/images/person.png");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
//        width: MediaQuery.of(context).size.width * 0.90,
//        height: MediaQuery.of(context).size.height * 0.50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.redAccent, width: 3.0),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: getProfPic()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Name: " + "Hassan Hamdy",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    " Age: " + "12",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Client Type: Student",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
//                    _authClient.signOut();
//                    Navigator.of(context).pushReplacementNamed("/auth");
                  },
                  child: Text(
                    "Edit Acc",
                    style: TextStyle(fontSize: 26.0),
                  ),
                  color: Theme.of(context).accentColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
