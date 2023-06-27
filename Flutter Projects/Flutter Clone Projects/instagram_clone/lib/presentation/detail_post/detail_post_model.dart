import 'package:firebase_auth/firebase_auth.dart';

class DetailPostModel {
  String getEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? 'No email';
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? 'No Name';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://cdn.goodkyung.com/news/photo/202302/200063_162949_1522.jpg';
  }
}
