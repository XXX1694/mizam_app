import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfileRepository {
  final _db = FirebaseFirestore.instance;
  editUserData(
    String name,
    String phone,
    String email,
  ) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      await _db.collection("users").doc(currentUser.email).update(
        {
          'email': email,
          'full_name': name,
          'phone_number': phone,
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
