import 'package:flutter_test/flutter_test.dart';
import 'package:search_image_app/data/data_source/result.dart';
import 'package:search_image_app/domain/repository/photo_api_repository.dart';
import 'package:search_image_app/domain/model/photo.dart';
import 'package:search_image_app/presentation/home/home_view_model.dart';

void main() {
  test(
    "Stream must work well",
    () async {
      final viewModel = HomeViewModel(FakePhotoApiRepository());

      await viewModel.fetch("apple");
      final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

      expect(viewModel.photos, result);
    },
  );
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(microseconds: 500));

    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
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
        "https://pixabay.com/get/g861d312d82a20d7db3c9c250756c4553020887de059cb67245c036262744fa4c6b493d7f9b78c28142872fce16cf7a6f_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/g494a487d12a74be37d5606e6439f73f9ff0f6f7e40beab4046a47bd99296d26074434ec40bd1d8059927c5d8c8f45ff1c80416d5c5659085df0ec49e226a02c3_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 515099,
    "downloads": 309877,
    "collections": 1306,
    "likes": 2391,
    "comments": 199,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
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
        "https://pixabay.com/get/g861d312d82a20d7db3c9c250756c4553020887de059cb67245c036262744fa4c6b493d7f9b78c28142872fce16cf7a6f_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/g494a487d12a74be37d5606e6439f73f9ff0f6f7e40beab4046a47bd99296d26074434ec40bd1d8059927c5d8c8f45ff1c80416d5c5659085df0ec49e226a02c3_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 515099,
    "downloads": 309877,
    "collections": 1306,
    "likes": 2391,
    "comments": 199,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
];
