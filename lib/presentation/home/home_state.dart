import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_image_app/domain/model/photo.dart';

part 'home_state.freezed.dart';

part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState(
    List<Photo> photos,
    bool isLoading,
  ) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
