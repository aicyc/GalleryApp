import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../cubits/gallery_cubit/gallery_cubit.dart';
import '../../cubits/theme_cubit/theme_cubit.dart';
import 'widgets/elastic_grid_view.dart';
import 'widgets/image_item_widget.dart';

part 'initial_screen_helper.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends InitialScreenHelper {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gallery App'),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.palette),
          tooltip: 'Change Theme',
          onPressed: themeCubit.changeTheme,
        ),
        actions: [
          IconButton(
            onPressed: galleryCubit.onRefresh,
            tooltip: 'Refresh',
            icon: const FaIcon(FontAwesomeIcons.arrowsRotate),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: galleryCubit.searchController,
              onChanged: (_) {
                galleryCubit.onChanged();
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                label: const Text('Search'),
                suffixIcon: galleryCubit.searchController.text.isEmpty
                    ? null
                    : IconButton(
                        onPressed: onClearTextController,
                        icon: const FaIcon(FontAwesomeIcons.xmark),
                      ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<GalleryCubit, GalleryState>(
              builder: (context, state) {
                final pixabayModels = state.pixabayModels;
                if (state.isLoading && pixabayModels.isEmpty) {
                  return loadingWidget;
                }
                if (pixabayModels.isEmpty) return emptyModelsWidget;
                return NotificationListener<ScrollEndNotification>(
                  onNotification: (scrollEnd) => onNotification(scrollEnd, state),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ElasticGridView(
                          primary: false,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: pixabayModels.length,
                          itemBuilder: (ctx, i) => ImageItemWidget(
                            pixabayModel: pixabayModels[i],
                          ),
                        ),
                        getFooter(state),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
