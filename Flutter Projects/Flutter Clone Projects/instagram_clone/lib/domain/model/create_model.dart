import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> uploadPost(String title, File imageUrl) async {
    final postsRef =
        FirebaseFirestore.instance.collection('posts').withConverter<Post>(
              fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
              toFirestore: (post, _) => post.toJson(),
            );

    postsRef.add(Post(
      userId: FirebaseAuth.instance.currentUser?.uid ?? '',
      title: title,
      imageUrl:
          'https://cdn.goodkyung.com/news/photo/202302/200063_162949_1522.jpg',
    ));
  }
}
