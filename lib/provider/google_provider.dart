import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleProvider extends ChangeNotifier {
  GoogleSignInAccount? googleAccount;
  final GoogleSignIn _gogleSignIn = GoogleSignIn();

  signOut(context) async {
    googleAccount = await _gogleSignIn.signOut().then(
          (value) => value == null
              ? Navigator.pushNamed(context, '/')
              : Navigator.pushNamed(context, '/acc'),
        );
    notifyListeners();
  }

  Future<UserCredential> signInWithGoogle() async {
    googleAccount = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleAccount?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
  
    notifyListeners();
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  
}
