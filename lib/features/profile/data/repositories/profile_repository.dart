import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mizam_app/features/authorization/data/models/user.dart';

class ProfileRepository {
  final _db = FirebaseFirestore.instance;
  getProfileData() async {
    UserModel? myUser;
    final currentUser = FirebaseAuth.instance.currentUser!;
    await _db.collection("users").get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          UserModel user = UserModel.fromJson(docSnapshot.data());
          if (user.email == currentUser.email) {
            myUser = user;
          }
        }
      },
    );
    return myUser;
  }

  Future<int> getUserStream() async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    await _db.collection("users").get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          Map<String, dynamic> user = docSnapshot.data();
          if (user['uid'] == currentUser.uid) {
            return user['stream'];
          }
        }
      },
    );
    return 1;
  }
}
