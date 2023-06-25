import 'package:flutter/material.dart';
import 'package:futurebuilder_stream/data/source/post_api.dart';
import 'package:futurebuilder_stream/domain/post.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({super.key});

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  final api = PostApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future UI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FutureBuilder<Post>(
                future: api.getPost(1),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error 발생 !!!');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // loading
                    return Text(
                      '로딩 중',
                      style: Theme.of(context).textTheme.displayLarge,
                    );
                  }

                  if (snapshot.hasData == false) {
                    // loading
                    return Text(
                      '데이터 없음',
                      style: Theme.of(context).textTheme.displayLarge,
                    );
                  }

                  // finished loading
                  Post post = snapshot.data!;
                  return Text(
                    post.toJson().toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('Future 실행'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
