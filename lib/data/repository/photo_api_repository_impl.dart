import 'package:search_image_app/data/data_source/pixabay_api.dart';
import 'package:search_image_app/domain/model/photo.dart';
import 'package:search_image_app/domain/repository/photo_api_repository.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  final PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<List<Photo>> fetch(String query) async {
    final result = await api.fetch(query);

    return result.map((e) => Photo.fromJson(e)).toList();
  }
}
