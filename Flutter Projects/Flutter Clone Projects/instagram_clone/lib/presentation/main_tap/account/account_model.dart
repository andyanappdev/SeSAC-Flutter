import 'package:firebase_auth/firebase_auth.dart';

class AccountModel {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? 'No Name';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://cdn.goodkyung.com/news/photo/202302/200063_162949_1522.jpg';
  }
}
