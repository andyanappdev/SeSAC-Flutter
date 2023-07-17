import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/presentation/main/main_view_model.dart';

void main() {
  test('Test Stream is fetching data well', () async {
    // viewModel test
    final viewModel = MainViewModel(MockPhotoApiRepository());

    await viewModel.fetch('apple');
    await viewModel.fetch('iphone');

    final List<Photo> result = mockJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.photos, result);
  });
}

// Mock 객체를 정의하여 Test
class MockPhotoApiRepository implements PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return mockJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> mockJson = [
  {
    "id": 634572,
    "pageURL":
        "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL":
        "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/g75fca08898d6632b4c84aa2fada2db1083bf0a2b888f4d75cdc99a64dcd3eb02261b5fdbc1d8f46e77397d066dc61c9d_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/gf86af32d96b579e27fc8333e3899576404cf26a9bd1618d78e565f7311875a92f8cdc7ad44910226a9ec42c347ea28659ba9aade026f8eec94d5888298d540bb_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 519563,
    "downloads": 313317,
    "collections": 1314,
    "likes": 2398,
    "comments": 200,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
  {
    "id": 1868496,
    "pageURL":
        "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g6e638c353c97390cd07d4f56fb988f395bcf3ccf50e730fad8532d7c29a477f9f0a0984914e4d76521ecbbc11a21e966c4e75ba97fc9fefbd8a91a881876f025_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g9e8b29372f8c661981d4af3c1a0588263b3e22dfb076bc4a54e9cb217bc2c8cb6124f276d4cb33ab419a215755a214d28a67a7cf2e5f3c08221ba8ad82c5f82a_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 749773,
    "downloads": 551880,
    "collections": 1419,
    "likes": 1085,
    "comments": 283,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  },
  {
    "id": 1873078,
    "pageURL": "https://pixabay.com/photos/apples-orchard-apple-trees-1873078/",
    "type": "photo",
    "tags": "apples, orchard, apple trees",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/30/15/23/apples-1873078_150.jpg",
    "previewWidth": 150,
    "previewHeight": 95,
    "webformatURL":
        "https://pixabay.com/get/gfcb7cd6ff521e02b3f3597e490dbac9cc116edbfe3757f1a2fb199b9b345fa624364b32ab72c30896658fa788307cfe3ae221b29a7e4254b0f92f6051b1f3ed2_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 408,
    "largeImageURL":
        "https://pixabay.com/get/g0961b2d7656224efa26cc9abcc32a3ac67158695c0ffa14d78ed1203775098e74f9a96b612fec4cf4a351cdebc62a7c60eddaafd891a1f5ae30307870440cc23_1280.jpg",
    "imageWidth": 3212,
    "imageHeight": 2051,
    "imageSize": 2581012,
    "views": 486661,
    "downloads": 292956,
    "collections": 1179,
    "likes": 1193,
    "comments": 182,
    "user_id": 3890388,
    "user": "lumix2004",
    "userImageURL": ""
  },
  {
    "id": 1122537,
    "pageURL":
        "https://pixabay.com/photos/apple-water-droplets-fruit-moist-1122537/",
    "type": "photo",
    "tags": "apple, water droplets, fruit",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_150.jpg",
    "previewWidth": 150,
    "previewHeight": 95,
    "webformatURL":
        "https://pixabay.com/get/gec82b1f7c8d46252c7dc93aca79c79fdabacba4f6f4a79d4788c45e044435dd975412003abe58d081f23b4cd909ebe15e049258a94a81338be97610d54d7245c_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 409,
    "largeImageURL":
        "https://pixabay.com/get/gae9351abb9e7771bc5a2070c7d7d83f46caa0b310dae4e873044b580236461cc75544fc23839fc9e736919d1379b87e9ea56c7da1db483de71b0f1c60779f771_1280.jpg",
    "imageWidth": 4752,
    "imageHeight": 3044,
    "imageSize": 5213632,
    "views": 353844,
    "downloads": 209537,
    "collections": 1065,
    "likes": 1181,
    "comments": 191,
    "user_id": 1445608,
    "user": "mploscar",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/01/05/14-08-20-943_250x250.jpg"
  },
  {
    "id": 256261,
    "pageURL":
        "https://pixabay.com/photos/apple-books-still-life-fruit-food-256261/",
    "type": "photo",
    "tags": "apple, books, still life",
    "previewURL":
        "https://cdn.pixabay.com/photo/2014/02/01/17/28/apple-256261_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g4782d53256aeb2a227b57191c3bc8a074ed25077b42129427ea9e483277ffb04df2a42b20397ad0aa997d7f36b374001_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 423,
    "largeImageURL":
        "https://pixabay.com/get/gf0862086544f42e0a252b23cf99583e79b392ba0a5b52c2a339e9baf51d32f44b95ab6bf570155969edb5d3332c566873848f25663ec606338ae0fbe08800003_1280.jpg",
    "imageWidth": 4928,
    "imageHeight": 3264,
    "imageSize": 2987083,
    "views": 549628,
    "downloads": 295524,
    "collections": 971,
    "likes": 991,
    "comments": 246,
    "user_id": 143740,
    "user": "jarmoluk",
    "userImageURL":
        "https://cdn.pixabay.com/user/2019/09/18/07-14-26-24_250x250.jpg"
  },
];
