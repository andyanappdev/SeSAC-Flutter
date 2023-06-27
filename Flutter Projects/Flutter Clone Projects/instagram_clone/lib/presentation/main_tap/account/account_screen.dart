import 'package:flutter/material.dart';
import 'package:instagram_clone/domain/model/account_model.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = AccountModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Clone'),
        actions: [
          IconButton(
            onPressed: () {
              model.logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://newsimg.sedaily.com/2023/05/10/29PIXQDV1Q_1.jpg'),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.bottomRight,
                      child: const SizedBox(
                        width: 25,
                        height: 25,
                        child: FloatingActionButton(
                          onPressed: null,
                          child: Icon(Icons.add_circle),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'IU',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Column(
              children: [
                Text('3', style: TextStyle(fontSize: 18)),
                Text(
                  '게시물',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Column(
              children: [
                Text('0', style: TextStyle(fontSize: 18)),
                Text(
                  '팔로우',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Column(
              children: [
                Text('0', style: TextStyle(fontSize: 18)),
                Text(
                  '팔로잉',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
