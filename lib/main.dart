import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'presentation/constants/theme_constants.dart';
import 'presentation/cubits/gallery_cubit/gallery_cubit.dart';
import 'presentation/cubits/theme_cubit/theme_cubit.dart';
import 'presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => GalleryCubit()),
      ],
      child: const MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return GetMaterialApp(
          title: 'Gallery App',
          theme: ThemeConstants.light,
          darkTheme: ThemeConstants.dark,
          themeMode: state.themeMode,
          home: const SplashScreen(),
        );
      },
    );
  }
}
