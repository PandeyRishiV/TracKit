import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:trackit/model/kit.dart';
import 'package:trackit/model/user.dart';

class DatabaseService {
  final DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('users');
  final FirebaseAuth auth = FirebaseAuth.instance;

  //Init User
  Future<void> createUser(String uid, String email) async {
    try {
      CurrentUser newUser = new CurrentUser(email, false, "", "");
      await reference.child(uid).set(<String, Object>{
        "email": newUser.email,
        "premium": newUser.premium,
        "tags": newUser.tags,
        "kits": newUser.kits,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  //Get User

  //Update User

  //Get tags

  //Add Kit
  Future<void> addKit(
      String title, String description, String tags, String uri) async {
    try {
      Kit newKit = new Kit(title + "__" + tags, title, description, uri, tags);
      reference
          .child(auth.currentUser!.uid)
          .child("kits")
          .child(newKit.id)
          .set({
        "id": newKit.id,
        "title": newKit.title,
        "description": newKit.description,
        "tags": newKit.tags,
        "uri": newKit.uri,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  //Get A Kit

  //Get Kits
  Future<List> getKits() async {
    List<Kit> allKits = [];
    try {
      reference
          .child(auth.currentUser!.uid)
          .child("kits")
          .onValue
          .listen((event) {
        print("--------------------------------------");
        print("biswa chutiya");

        print("-----------------------------------------------");
      });
    } catch (e) {}
    return allKits;
  }

  //Modify Kit
}
