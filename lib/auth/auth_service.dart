import 'package:ecom_basic_admin/db/db_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static User? get currentUser => _auth.currentUser;

  static Future<bool> loginAdmin(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return DbHelper.isAdmin(credential.user!.uid);
  }

  static Future<void> logout() {
    return _auth.signOut();
  }
}