import 'package:basic_of_ui_interaction/presentation/main/components/custom_button.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _isFavorite = false;

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
      'https://file.mk.co.kr/meet/neds/2023/02/image_readtop_2023_117777_16759917015347929.jpg',
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
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '아이유는 아이가 아니에요',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '아이유 30살 넘었다!',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isFavorite = !_isFavorite;
            });
          },
          child: Row(
            children: [
              Icon(
                _isFavorite ? Icons.star : Icons.star_border,
                color: Colors.red,
              ),
              const Text('41'),
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: const Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }
}
