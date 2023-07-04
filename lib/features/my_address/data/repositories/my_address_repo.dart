import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../authorization/data/models/user.dart';

class MyAddressRepo {
  final _db = FirebaseFirestore.instance;
  Future<bool> addAddress(address) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      await _db.collection("users").get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            UserModel user = UserModel.fromJson(docSnapshot.data());
            if (user.email == currentUser.email) {
              _db.collection('users').doc(currentUser.email).update(
                {
                  'address': FieldValue.arrayUnion(
                    [address],
                  ),
                },
              );
            }
          }
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteAddress(List<String> address) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      await _db.collection("users").get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            UserModel user = UserModel.fromJson(docSnapshot.data());
            if (user.email == currentUser.email) {
              _db.collection('users').doc(currentUser.email).update(
                {
                  'address': FieldValue.arrayRemove(
                    address,
                  ),
                },
              );
            }
          }
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
