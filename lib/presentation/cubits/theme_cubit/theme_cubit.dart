import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/preference_utils.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';
part 'theme_cubit.g.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.initial());

  SharedPreferences get storage => PreferenceUtils.instance;

  void initTheme() {
    final newState = _getData();
    if (newState == null) return;
    emit(newState);
  }

  void changeTheme() {
    final themeMode = state.themeMode.isDark ? ThemeMode.light : ThemeMode.dark;
    _changeTheme(themeMode);
  }

  void _changeTheme(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
    _saveData();
  }

  ThemeState? _getData() {
    final jsonState = storage.getString('_THEME_DATA_');
    if (jsonState == null) return null;
    return ThemeState.fromJson(jsonDecode(jsonState));
  }

  Future<bool> _saveData() {
    final jsonState = state.toJson();
    return storage.setString('_THEME_DATA_', jsonEncode(jsonState));
  }
}
