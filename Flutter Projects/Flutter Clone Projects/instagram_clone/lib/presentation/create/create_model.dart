import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/domain/model/post.dart';

class CreateModel {
  final ImagePicker _picker = ImagePicker(); // ImagePicker 생성

  Future<File?> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    return File(image.path);
  }

  Future<void> uploadPost(String title, File imageFile) async {
    // 이미지 업로드
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef
        .child('postImages/${DateTime.now().millisecondsSinceEpoch}.;png');

    //업로드된 이미지의 url 주소 가져오기
    await imageRef.putFile(imageFile);
    final downloadUrl = await imageRef.getDownloadURL();

    // post 업로드
    final postsRef =
        FirebaseFirestore.instance.collection('posts').withConverter<Post>(
              fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
              toFirestore: (post, _) => post.toJson(),
            );

    final newPostRef = postsRef.doc();

    newPostRef.set(Post(
      id: newPostRef.id,
      userId: FirebaseAuth.instance.currentUser?.uid ?? '',
      title: title,
      imageUrl: downloadUrl,
    ));
  }
}
