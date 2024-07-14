import 'package:firebase_auth/firebase_auth.dart';

class FbAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
// sign in annon 
  Future signInAnon() async {
    try {
      var result = await _auth.signInAnonymously();
      var user = result.user ; 
      return user ; 
    } catch (e) {
      print(e.toString()); 
      return null ; 

    }
  }

// sign in with email and password 
  Future signInWithEmail (String email , String password) async { 
    try {
      var result = await _auth.signInWithEmailAndPassword(email: email, password: password) ; 
      var user = result.user ; 
      return user ; 
      
    } catch (e) {
      print(e.toString()); 
      return null ; 
    }
  }
}
