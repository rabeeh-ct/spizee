import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spizee/utils/debug_utils.dart';

import '../../utils/snackbar_utils.dart';

class FirebaseAuthClient {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> login({required Map<String, dynamic> params}) async {
    User? user;

    var userCred = await auth.signInWithEmailAndPassword(
      email: params["email"],
      password: params["password"],
    );
    user = userCred.user;
    return user;
  }

  Future<User?> register({required Map<String, dynamic> params}) async {
    User? user;

    var userCred = await auth.createUserWithEmailAndPassword(
      email: params["email"],
      password: params["password"],
    );
    user = userCred.user;
    return user;
  }

  Future<void> logout() async {
    User? user;

    var userCred = await auth.signOut();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    // user = userCred.user;
    return userCred;
  }

  Future<User?> signInWithGoogle() async {
    consoleLog(">>>>>>>>>2");
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    consoleLog(">>>>>>>>>3");
    late GoogleSignInAccount? googleSignInAccount;
    try {
      googleSignInAccount = await googleSignIn.signIn();
    } catch (e) {
      consoleLog(e);
    }
    // late GoogleSignInAccount? googleSignInAccount;
    // await googleSignIn.signIn();
    consoleLog(">>>>>>>>>4");

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential = await auth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          showMessage("Email already exist");
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        consoleLog("error $e");
        showMessage("Sorry try again later");
        // handle the error here
      }
    }
    return user;
  }

  Future<String?> verifyPhoneNumber(String params) async {
    // FirebaseAuthException? firebaseAuthException;
    String? verificationCode;
      await auth.verifyPhoneNumber(
        phoneNumber: params,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          // final  data = await auth.signInWithCredential(credential);
          // user= data.user;
        },
        verificationFailed: (error) {
          throw error;
        },
        codeSent: (String verificationId, int? resendToken) async {
          consoleLog("verificationId >>>>>>> $verificationId");
          verificationCode = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      consoleLog(verificationCode);
    return verificationCode;

  }

  Future<User?> phoneNumberSignIn(Map<String,dynamic> params) async{
    try {
      final PhoneAuthCredential cred = PhoneAuthProvider.credential(
          verificationId: params["verification_id"], smsCode: params["sms_code"]);
      final userCred = await auth.signInWithCredential(cred);
      return userCred.user;
    }on FirebaseAuthException catch(e){
      rethrow;
    }
  }
}
