import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


//listado de colores inmutables(no cambian)
final colorListProvider = Provider((ref) => colorList);

//un simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//UN SIMPLE INT
final selectedColorProvider = StateProvider((ref) => 0);
