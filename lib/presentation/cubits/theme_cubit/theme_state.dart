part of 'theme_cubit.dart';

extension ThemeModeExt on ThemeMode {
  String get name {
    switch (this) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }

  bool get isLight => this == ThemeMode.light;
  bool get isSystem => this == ThemeMode.system;
  bool get isDark => this == ThemeMode.dark;
}

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.initial({
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _Initial;

  factory ThemeState.fromJson(Map<String, dynamic> json) => _$ThemeStateFromJson(json);
}
