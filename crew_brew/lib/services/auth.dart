import 'package:crew_brew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  TheUser _userFromFirebaseUser (FirebaseUser user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream <TheUser> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }
}