import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordRepo {
  changePassword(String oldPassword, String newPassword) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      final cred = EmailAuthProvider.credential(
          email: currentUser!.email ?? '', password: oldPassword);
      await currentUser.reauthenticateWithCredential(cred);
      await currentUser.updatePassword(newPassword);
      return true;
    } catch (e) {
      return false;
    }
  }
}
