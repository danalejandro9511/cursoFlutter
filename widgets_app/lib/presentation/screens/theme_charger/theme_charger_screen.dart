import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChargerScreen extends ConsumerWidget {

  static const String name = 'theme_charger_screen';

  const ThemeChargerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Charger'),
        actions: [
          IconButton(
            icon: Icon( isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined ),
            onPressed: (){
              //ref.read(isDarkProvider.notifier).state = !ref.read(isDarkProvider.notifier).state;
              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            },
          ) 
        ],
      ),
      body: const _ThemeChargerView()
    );
  }
}

class _ThemeChargerView extends ConsumerWidget {
  const _ThemeChargerView();

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);

    //final selectedColor = ref.watch(selectedColorProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor; 


    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${ color.value }'),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value){
            ref.read(themeNotifierProvider.notifier).changeColor(index);
            //ref.read(selectedColorProvider.notifier).state = index;
          },
        );
      },
    );
  }
}