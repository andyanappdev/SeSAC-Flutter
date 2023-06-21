import 'package:basic_of_ui_interaction/domain/model/post.dart';
import 'package:basic_of_ui_interaction/domain/repository/post_repository.dart';
import 'package:basic_of_ui_interaction/presentation/main/components/post_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Post> posts = PostRepository().getPosts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adding interactivity'),
      ),
      body: ListView(
        children: posts.map((post) {
          return PostWidget(
            post: post,
            onFavoriteTapped: (post) {
              setState(() {
                posts = posts.map((e) {
                  if (e.id == post.id) {
                    switch (e.isFavorite) {
                      case true:
                        e.isFavorite = false;
                        e.favoriteCount -= 1;
                      case false:
                        e.isFavorite = true;
                        e.favoriteCount += 1;
                    }
                  }
                  return e;
                }).toList();
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
