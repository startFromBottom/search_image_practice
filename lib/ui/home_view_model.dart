import 'dart:async';
import 'package:search_image_app/data/photo_api_repository.dart';
import 'package:search_image_app/model/photo.dart';

class HomeViewModel {
  final PhotoApiRepository repository;
  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoStreamController.add(result);
  }
}
