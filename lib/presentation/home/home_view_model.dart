import 'dart:async';
import 'dart:collection';
import 'package:flutter/widgets.dart';
import 'package:search_image_app/data/data_source/result.dart';
import 'package:search_image_app/domain/repository/photo_api_repository.dart';
import 'package:search_image_app/domain/model/photo.dart';
import 'package:search_image_app/presentation/home/home_state.dart';
import 'package:search_image_app/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  HomeState _state = HomeState([], false);
  HomeState get state => _state;

  // List<Photo> _photos = [];
  // UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    // 상태가 변할 때 마다 notifyListeners() 사용!
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> result = await repository.fetch(query);

    result.when(
      success: (photos) {
        _state = state.copyWith(photos: photos);
        notifyListeners();
      },
      error: (message) {
        print(message);
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
