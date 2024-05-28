import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
              onPressed: () {
                //ref.read(isDarkModeProvider.notifier).update((state) => !state);
                ref.read(themeNotifierProvider.notifier).toogleDarkMode();
              },
              icon: isDarkMode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined))
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);

    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text(
            'Este color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.watch(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}
