import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/main_tap/home/home_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = HomeModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Clone'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Instagram에 오신 것을 환영합나다.',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text('사진과 동영상을 보려면 팔로우 하세요'),
            const SizedBox(height: 20),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(model.getProfileImageUrl()),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      model.getEmail(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(model.getNickName()),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2023/04/27/0e83f60f-51d4-49b2-919c-92ec2ff928c5.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 4),
                        Image.network(
                          'https://thumb.mtstarnews.com/06/2023/04/2023042711272196462_1.jpg/dims/optimize',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 4),
                        Image.network(
                          'https://cphoto.asiae.co.kr/listimglink/1/2022062016015219931_1655708512.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Facebook 친구'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('팔로우'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
