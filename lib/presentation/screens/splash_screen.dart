import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubits/gallery_cubit/gallery_cubit.dart';
import '../cubits/theme_cubit/theme_cubit.dart';
import '../utils/preference_utils.dart';
import 'initial_screen/initial_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final themeCubit = BlocProvider.of<ThemeCubit>(context),
      galleryCubit = BlocProvider.of<GalleryCubit>(context);

  @override
  void initState() {
    super.initState();
    initApp();
  }

  void initApp() async {
    await PreferenceUtils.init();
    galleryCubit.initApp();
    themeCubit.initTheme();

    Get.off(() => InitialScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
