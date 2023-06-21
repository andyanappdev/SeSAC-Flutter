import 'package:basic_of_ui_interaction/domain/model/post.dart';
import 'package:basic_of_ui_interaction/presentation/main/components/custom_button.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  // final int favoriteCount;
  final Function(Post post) onFavoriteTapped; // callback 함수

  const PostWidget({
    super.key,
    required this.post,
    // required this.favoriteCount,
    required this.onFavoriteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _topImage(),
        _middleSection(),
        _bottomText(),
      ],
    );
  }

  Widget _topImage() {
    return Image.network(
      post.imageUrl,
      height: 300,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _middleSection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _titleSection(),
          const SizedBox(height: 30),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _titleSection() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                post.subTitle,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            onFavoriteTapped(post); // callback 전달
          },
          child: Row(
            children: [
              Icon(
                post.isFavorite ? Icons.star : Icons.star_border,
                color: Colors.red,
              ),
              Text('${post.favoriteCount}'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButtons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          top: Icon(Icons.call, color: Colors.blue),
          bottom: Text('CALL', style: TextStyle(color: Colors.blue)),
        ),
        CustomButton(
          top: Icon(Icons.near_me, color: Colors.blue),
          bottom: Text('ROUTE', style: TextStyle(color: Colors.blue)),
        ),
        CustomButton(
          top: Icon(Icons.share, color: Colors.blue),
          bottom: Text('SHARE', style: TextStyle(color: Colors.blue)),
        )
      ],
    );
  }

  Widget _bottomText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
      child: Text(
        post.content,
        softWrap: true,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
