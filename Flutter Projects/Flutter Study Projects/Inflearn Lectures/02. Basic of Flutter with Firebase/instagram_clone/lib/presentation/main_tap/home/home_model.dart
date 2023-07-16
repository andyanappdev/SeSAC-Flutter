import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class HomeModel {
  final ImagePicker _picker = ImagePicker(); // ImagePicker 생성

  Future<void> updateProfileImage() async {
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);

    if (xFile != null) {
      // 선택한 사진 업로드
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child(
          'user/${FirebaseAuth.instance.currentUser?.uid}/profile/${DateTime.now().millisecondsSinceEpoch}.;png');

      //업로드된 이미지의 url 주소 가져오기
      await imageRef.putFile(File(xFile.path));
      final downloadUrl = await imageRef.getDownloadURL();

      // 업데이트
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(downloadUrl);
    }
  }

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
