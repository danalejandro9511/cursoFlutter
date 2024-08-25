import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkProvider = StateProvider((ref) => false);

//listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
  (ref) => ThemeNotifier(),
);


//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {

  //STATE = ESTADO = NEW AppTheme()
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColor(int index) {
    state = state.copyWith(selectedColor: index);
  }

  
}