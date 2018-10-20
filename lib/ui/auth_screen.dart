import 'package:flutter/material.dart';
import 'package:m3ml/helpers/helpers.dart';
import 'package:m3ml/model/user_model.dart';
import 'package:m3ml/util/database_client.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String _email;
  String _password;

  DatabaseClient _databaseClient = DatabaseClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: <Widget>[
            TextFormField(
              onSaved: (email) => _email = email,
              validator: (email) => Validation.isValidEmail(email, context),
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "ZinyProgrammers@Nasa.com",
              ),
            ),
            TextFormField(
              onSaved: (password) => _password = password,
              obscureText: true,
              validator: (password) =>
                  Validation.isValidPassword(password, context),
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Ziny12345",
              ),
            ),
          ],
        )),
      ),
    );
  }
}
