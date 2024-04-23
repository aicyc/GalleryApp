part of 'gallery_cubit.dart';

abstract class GalleryCubitHelper extends Cubit<GalleryState> {
  GalleryCubitHelper(super.initialState);

  final _imageRepository = ImageRepository();
  CancelableOperation<(ReqRespImgType, List<PixabayModel>?)>? _cancelOpImages;
  int _page = 0;

  final searchController = TextEditingController();

  Future<ReqRespImgType?> _loadModels({int? page}) async {
    const perPage = 50;
    final isRefresh = page != null;
    emit(state.copyWith(isLoading: true));
    if (isRefresh) {
      emit(state.copyWith(pixabayModels: [], isNoData: false));
    }
    page ??= _page + 1;

    _cancelOpImages?.cancel();
    _cancelOpImages = CancelableOperation.fromFuture(
      _imageRepository.getModels(
        page: page,
        perPage: perPage,
        searchText: searchController.text,
        debounceTime: const Duration(milliseconds: 1500),
      ),
    );
    final result = await _cancelOpImages!.valueOrCancellation();
    if (result == null) return null;

    final (reqRespImgType, newModels) = result;
    emit(state.copyWith(isLoading: false, isNoData: reqRespImgType.isNoData));
    if (reqRespImgType.isNoData || reqRespImgType.isError) {
      return reqRespImgType;
    }

    emit(state.copyWith(
      pixabayModels: [
        if (!isRefresh) ...state.pixabayModels,
        ...newModels!,
      ],
      isNoData: perPage > newModels.length,
    ));

    _page = page + 1;

    return reqRespImgType;
  }
}
