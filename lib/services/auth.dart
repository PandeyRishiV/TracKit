import 'package:firebase_auth/firebase_auth.dart';
import 'package:trackit/models/users.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create Users object
  Users _usersFirebase(FirebaseUser user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  //Auth Change user stream
  Stream<Users> get user {
    return _auth.onAuthStateChanged.map(_usersFirebase);
  }

  //Register Email And Password
  Future registerEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _usersFirebase(user);
    } catch (e) {
      print("CREATE EMAIL AND PASSWORD ERROR ---------------->" + e.toString());
      return null;
    }
  }

  //Sign In Email And Password
  Future signInEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _usersFirebase(user);
    } catch (e) {
      print(
          "SIGN IN EMAIL AND PASSWORD ERROR ----------------->" + e.toString());
      return null;
    }
  }

  //Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("SIGNOUT ERROR ------------->" + e.toString());
      return null;
    }
  }
}
