import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthClient {
  final FirebaseAuth _authClient = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
//  final FacebookLogin _facebookLogin = FacebookLogin();

  static AuthClient _instance = AuthClient.internal();
  AuthClient.internal();
  factory AuthClient() => _instance;
//  AuthClient(this._authClient);

  // isLoggedIn?
  // Returns FirebaseUser if loggedIn and null if Not LoggedIn
  Future<FirebaseUser> isLoggedIn() async {
    return await _authClient.currentUser();
  }

  // SignIn Using Email & Password
  // Returns FirebaseUser on Success
  Future<FirebaseUser> signInWithEmailAndPassword(
      String email, String password) async {
    return await _authClient.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // Sign Out From Google Account & FB Account & Firebase _auth
  // No Returns
  Future<void> signOut() async {
    FirebaseUser user = await _authClient.currentUser();
    switch (user.providerData[1]?.providerId) {
      case "google.com":
        await _googleSignIn.signOut();
        return await _authClient.signOut();

      case "facebook.com":
//        await _facebookLogin.logOut();
        return await _authClient.signOut();

      default: // same as "password"
        return await _authClient.signOut();
    }
  }

  // Sign In With FB Method
  // Returns FirebaseUser on success and throws Exceptions on Fail
  Future<FirebaseUser> signInWithFacebook() async {
//    final FacebookLoginResult result =
//        await _facebookLogin.logInWithReadPermissions(['email']);
//
//    switch (result.status) {
//      case FacebookLoginStatus.loggedIn:
//        FirebaseUser user = await _authClient.signInWithFacebook(
//            accessToken: result.accessToken.token);
//
//        print("[-Log-][Log Sys][FLoggedIn] : " + user.toString());
//        return user;
//
//      case FacebookLoginStatus.cancelledByUser:
//        return throw Exception("cancelledByUser");
//
//      case FacebookLoginStatus.error:
//        print("[-Log-][Log Sys][FLoggedIn] : ${result.errorMessage}");
//        return throw Exception(result.errorMessage);
//    }
    return throw Exception("Unknown Erorr happened");
  }

  // SignUp Using Email & Password
  // Returns FirebaseUser on Success
  Future<FirebaseUser> signUpWithEmailAndPassword(
      String email, String password) async {
    return await _authClient.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // sendPasswordResetLink Using Email
  // No Returns
  Future<void> sendPasswordResetLink(String email) async {
    return await _authClient.sendPasswordResetEmail(email: email);
  }

  // Sign In With Google Method Using Firebase auth
  // Returns FirebaseUser if Logged In
  Future<FirebaseUser> signInWithGoogle() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    return await _authClient.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
  }
}
