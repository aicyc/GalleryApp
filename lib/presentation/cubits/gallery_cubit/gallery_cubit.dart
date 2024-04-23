import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../repository/image_repository.dart';
import '../../models/pixabay_model/pixabay_model.dart';

part 'gallery_state.dart';
part 'gallery_cubit.freezed.dart';
part 'gallery_cubit_helper.dart';

class GalleryCubit extends GalleryCubitHelper {
  GalleryCubit() : super(const GalleryState.initial());

  void initApp() async {
    final reqRespImgType = await _loadModels(page: 1);
    if (reqRespImgType == null) return;
    if (reqRespImgType.isError) {}
  }

  void onRefresh() async {
    final reqRespImgType = await _loadModels(page: 1);
    if (reqRespImgType == null) return;

    // switch (reqRespImgType) {
    //   case ReqRespImgType.error:
    //     refreshController.refreshFailed();
    //   case ReqRespImgType.complete:
    //     refreshController.refreshCompleted();
    //   default:
    // }
  }

  void onChanged([_]) => _loadModels(page: 1);
  void onLoading() async {
    final reqRespImgType = await _loadModels();
    if (reqRespImgType == null) return;

    // switch (reqRespImgType) {
    //   case ReqRespImgType.error:
    //     refreshController.loadFailed();
    //   case ReqRespImgType.complete:
    //     refreshController.loadComplete();
    //   case ReqRespImgType.noData:
    //     refreshController.loadNoData();
    // }
  }
}
