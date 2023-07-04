import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mizam_app/features/authorization/data/models/user.dart';

class AuthRepo {
  var verificationId = '';
  final _db = FirebaseFirestore.instance;
  createUserByEmailAndPassword(
      String emailAddress, String password, String fullName) async {
    try {
      // ignore: unused_local_variable

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final user = credential.user;
      await user?.sendEmailVerification();
      final userModel = UserModel(
        fullName,
        emailAddress,
        password,
        '',
        [],
      );
      userToFirestore(userModel, credential);
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return 'Something went wrong.';
    }
  }

  userToFirestore(UserModel user, UserCredential credential) async {
    await _db
        .collection('users')
        .doc(credential.user!.email)
        .set(user.toJson());
  }

  userSingOut() async {
    await FirebaseAuth.instance.signOut();
  }

  signInWithEmailAndPassowrd(String emailAddress, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return 'Something went wrong.';
      }
    }
  }

  Future<String> verifyNumber(String phone) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        codeSent: (verificationId, forceResendingToken) {
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId = verificationId;
        },
        verificationFailed: (error) {},
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return 'error';
    }
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await FirebaseAuth.instance.signInWithCredential(
      PhoneAuthProvider.credential(
        smsCode: otp,
        verificationId: verificationId,
      ),
    );
    if (credentials.user != null) {
      return true;
    } else {
      return false;
    }
  }

  resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }
}
