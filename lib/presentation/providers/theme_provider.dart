import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//listado de colores inmutables(no cambian)
final colorListProvider = Provider((ref) => colorList);

//un simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//UN SIMPLE INT
final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme (personalizado)

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  //state+ estado de nueva instancaia a appthem
  ThemeNotifier() : super(AppTheme());

  void toogleDarkMode() {
    state = state.copyWith(
      isDarkMode: !state.isDarkMode,
    );
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(
      selectedColor: colorIndex
    );
  }
}
