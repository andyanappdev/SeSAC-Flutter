import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  final List<String> _urls = const [
    'https://file.mk.co.kr/meet/neds/2022/01/image_readtop_2022_11126_16413417794906913.jpg',
    'https://assets.repress.co.kr/photos/2009ea104d2c842fed5461308d9f92d7/original.jpg',
    'https://www.apparelnews.co.kr/upfiles/manage/202210/84301826fb2849d73ed82e7b97d30204.jpg',
    'https://images.khan.co.kr/article/2023/04/24/news-p.v1.20230421.936d9b58520d438b870b6b168fbecb4c_P1.jpg',
    'https://file2.nocutnews.co.kr/newsroom/image/2023/05/10/202305101708425779_0.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Clone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GridView.builder(
            itemCount: _urls.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
            ), // GridView의 열 갯수 설정
            itemBuilder: (BuildContext context, int index) {
              final url = _urls[index];
              return Image.network(
                url,
                fit: BoxFit.cover,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.create),
      ),
    );
  }
}
