import 'dart:async';

import '../presentation/models/pixabay_model/pixabay_model.dart';
import 'api_client.dart';

enum ReqRespImgType {
  error,
  complete,
  noData;

  bool get isError => this == error;
  bool get isComplete => this == complete;
  bool get isNoData => this == noData;
}

class ImageRepository {
  ImageRepository();

  final _apiClient = ApiClient();

  Future<(ReqRespImgType, List<PixabayModel>?)> getModels({
    int page = 1,
    int perPage = 50,
    String searchText = '',
    Duration debounceTime = const Duration(milliseconds: 5000),
  }) async {
    await Future.delayed(debounceTime);
    final queryParams = {
      'page': '$page',
      'per_page': '$perPage',
      if (searchText.isNotEmpty) 'q': searchText.replaceAll(' ', '+'),
    };
    try {
      final responseData = await _apiClient.get(
        path: 'api/',
        queryParameters: queryParams,
      );
      final hits = responseData['hits'] as List;

      if (hits.isEmpty) return (ReqRespImgType.noData, null);

      final pixabayModels = hits.map((e) => PixabayModel.fromJson(e)).toList();
      return (ReqRespImgType.complete, pixabayModels);
    } catch (e) {
      return (ReqRespImgType.error, null);
    }
  }
}
