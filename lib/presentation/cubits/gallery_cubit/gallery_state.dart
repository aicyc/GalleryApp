part of 'gallery_cubit.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState.initial({
    @Default([]) List<PixabayModel> pixabayModels,
    @Default(true) bool isLoading,
    @Default(false) bool isNoData,
    String? error,
  }) = _Initial;
}
