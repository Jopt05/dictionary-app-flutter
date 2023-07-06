import 'package:flutter_dictionary_app/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorListProvider = Provider((ref) => colorList);
final isDarkModeProvider = StateProvider((ref) => false);
final selectedColorProvider = StateProvider((ref) => 0);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {

  ThemeNotifier(): super( AppTheme() );

  void toggleDarkmode() {

    state = state.copyWith(
      isDarkMode: !state.isDarkMode
    );

  }

  void changeColorIndex( int colorIndex ) {

    state = state.copyWith(
      selectedColor: colorIndex
    );

  }

}