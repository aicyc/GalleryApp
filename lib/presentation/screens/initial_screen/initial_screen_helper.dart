part of 'initial_screen.dart';

// extension LoadStatusExt on LoadStatus {
//   bool get isLoading => this == LoadStatus.loading;
//   bool get isFailed => this == LoadStatus.failed;
//   bool get isNoMore => this == LoadStatus.noMore;
// }

abstract class InitialScreenHelper extends State<InitialScreen> {
  late final galleryCubit = BlocProvider.of<GalleryCubit>(context),
      themeCubit = BlocProvider.of<ThemeCubit>(context);

  @override
  void initState() {
    super.initState();
    galleryCubit.onLoading();
  }

  Widget get loadingWidget => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 32),
            Text(
              'Loading...',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      );

  Widget get emptyModelsWidget => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (galleryCubit.searchController.text.isNotEmpty) ...[
              Text(
                'No results were found for your request',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: onClearTextController,
                child: const Text('Clear search'),
              )
            ]
          ],
        ),
      );

  // Widget get footer => CustomFooter(
  //       builder: (BuildContext context, LoadStatus? mode) {
  //         if (mode == null) return const SizedBox(height: 32);
  //         if (mode.isLoading) {
  //           return const SizedBox(
  //             height: 64,
  //             child: Center(
  //               child: CircularProgressIndicator(),
  //             ),
  //           );
  //         } else if (mode.isFailed) {
  //           return Column(
  //             children: [
  //               const Text("Load Failed!\nClick retry!"),
  //               FilledButton(
  //                 onPressed: galleryCubit.refreshController.requestLoading,
  //                 child: const Text('Retry'),
  //               ),
  //             ],
  //           );
  //         } else if (mode.isNoMore) {
  //           return Container(
  //             height: 64,
  //             padding: const EdgeInsets.all(8.0),
  //             child: Text(
  //               'No more data',
  //               textAlign: TextAlign.center,
  //               style: Theme.of(context).textTheme.bodyLarge,
  //             ),
  //           );
  //         } else {
  //           return _buttonLoadMore;
  //         }
  //       },
  //     );

  Widget get _buttonLoadMore => FilledButton(
        style: FilledButton.styleFrom(
          fixedSize: Size(Get.width, 48),
          shape: const BeveledRectangleBorder(),
        ),
        onPressed: galleryCubit.onLoading,
        child: const Text('Load More'),
      );

  bool onNotification(
    ScrollEndNotification scrollEnd,
    GalleryState state,
  ) {
    if (state.isNoData) return true;

    final metrics = scrollEnd.metrics;
    if (metrics.atEdge) {
      bool isTop = metrics.pixels == 0;
      if (isTop) return true;
      galleryCubit.onLoading();
    }
    return true;
  }

  Widget getFooter(GalleryState state) {
    if (state.isNoData) return Container();
    if (state.isLoading) {
      return Container(
        width: 64,
        height: 64,
        margin: const EdgeInsets.all(12.0),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return _buttonLoadMore;
  }

  void onClearTextController() {
    galleryCubit.searchController.clear();
    galleryCubit.onRefresh();
  }
}
