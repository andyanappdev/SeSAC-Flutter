import 'package:flutter/material.dart';
import 'package:instagram_clone/domain/model/post.dart';
import 'package:instagram_clone/presentation/detail_post/detail_post_model.dart';

class DetailPostScreen extends StatelessWidget {
  final Post post;
  const DetailPostScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final model = DetailPostModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(model.getProfileImageUrl()),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.getEmail(),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(model.getNickName()),
                  ],
                ),
              ],
            ),
          ),
          Image.network(
            post.imageUrl,
            width: 500,
            height: 500,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.title),
          ),
        ],
      ),
    );
  }
}
