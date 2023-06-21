import 'package:basic_of_ui_interaction/domain/model/post.dart';

class PostRepository {
  List<Post> getPosts() {
    return [
      Post(
        id: 1,
        imageUrl:
            'https://file.mk.co.kr/meet/neds/2023/02/image_readtop_2023_117777_16759917015347929.jpg',
        title: '아이유는 어른이에요',
        subTitle: '아이유 30 넘었다!!!',
        isFavorite: false,
        favoriteCount: 5,
        content:
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
        ''',
      ),
      Post(
        id: 2,
        imageUrl:
            'https://file2.nocutnews.co.kr/newsroom/image/2023/05/03/202305031714287586_0.jpg',
        title: '아이유는 어려 보여요',
        subTitle: '하지만 30 넘었다!!!',
        isFavorite: true,
        favoriteCount: 2,
        content:
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
        ''',
      ),
      Post(
        id: 3,
        imageUrl:
            'https://img.newspim.com/news/2022/06/21/2206211018020310.jpg',
        title: '아이유는 아이에요',
        subTitle: '아이유 30 넘었다',
        isFavorite: true,
        favoriteCount: 10,
        content:
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
        ''',
      ),
    ];
  }
}
