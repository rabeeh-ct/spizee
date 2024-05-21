import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/snackbar_utils.dart';

class FirebaseAuthClient{
  Future<User?> login({required Map<String, dynamic> params}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    var userCred = await auth.signInWithEmailAndPassword(
      email: params["email"],
      password: params["password"],
    );
    user = userCred.user;
    return user;
  }

  Future<User?> register({required Map<String, dynamic> params}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    var userCred = await auth.createUserWithEmailAndPassword(
      email: params["email"],
      password: params["password"],
    );
    user = userCred.user;
    return user;
  }

  Future<void> logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    var userCred = await auth.signOut();
    // user = userCred.user;
    return userCred;
  }
}