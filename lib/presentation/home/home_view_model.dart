import 'dart:async';
import 'dart:collection';
import 'package:flutter/widgets.dart';
import 'package:search_image_app/data/data_source/result.dart';
import 'package:search_image_app/domain/repository/photo_api_repository.dart';
import 'package:search_image_app/domain/model/photo.dart';
import 'package:search_image_app/domain/use_case/get_photos_use_case.dart';
import 'package:search_image_app/presentation/home/home_state.dart';
import 'package:search_image_app/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  HomeState _state = HomeState([], false);
  HomeState get state => _state;

  // List<Photo> _photos = [];
  // UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.getPhotosUseCase);

  Future<void> fetch(String query) async {
    // 상태가 변할 때 마다 notifyListeners() 사용!
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    // dart에서 call 메서드 : 생략 가능!
    final Result<List<Photo>> result = await getPhotosUseCase(query);

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
