// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixabay_model.freezed.dart';
part 'pixabay_model.g.dart';

@freezed
class PixabayModel with _$PixabayModel {
  const factory PixabayModel({
    required int id,
    required String previewURL,
    required int previewWidth,
    required int previewHeight,
    required String webformatURL,
    required int webformatWidth,
    required int webformatHeight,
    required String largeImageURL,
    required int imageWidth,
    required int imageHeight,
    required int views,
    required int likes,
  }) = _PixabayModel;

  factory PixabayModel.fromJson(Map<String, dynamic> json) =>
      _$PixabayModelFromJson(json);
}
