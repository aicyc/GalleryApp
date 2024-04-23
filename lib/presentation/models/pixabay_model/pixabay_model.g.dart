// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PixabayModelImpl _$$PixabayModelImplFromJson(Map<String, dynamic> json) =>
    _$PixabayModelImpl(
      id: json['id'] as int,
      previewURL: json['previewURL'] as String,
      previewWidth: json['previewWidth'] as int,
      previewHeight: json['previewHeight'] as int,
      webformatURL: json['webformatURL'] as String,
      webformatWidth: json['webformatWidth'] as int,
      webformatHeight: json['webformatHeight'] as int,
      largeImageURL: json['largeImageURL'] as String,
      imageWidth: json['imageWidth'] as int,
      imageHeight: json['imageHeight'] as int,
      views: json['views'] as int,
      likes: json['likes'] as int,
    );

Map<String, dynamic> _$$PixabayModelImplToJson(_$PixabayModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'previewURL': instance.previewURL,
      'previewWidth': instance.previewWidth,
      'previewHeight': instance.previewHeight,
      'webformatURL': instance.webformatURL,
      'webformatWidth': instance.webformatWidth,
      'webformatHeight': instance.webformatHeight,
      'largeImageURL': instance.largeImageURL,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'views': instance.views,
      'likes': instance.likes,
    };
