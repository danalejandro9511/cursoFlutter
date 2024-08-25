import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola, soy un snackbar'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Cerrar',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog( BuildContext context) {

    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas Seguro?'),
        content: const Text('Ea ad nostrud officia adipisicing ex pariatur irure magna occaecat. Amet incididunt labore mollit voluptate incididunt est ipsum eiusmod amet velit eiusmod. Aliqua dolore nostrud voluptate incididunt aliquip aliquip cillum nisi deserunt qui aliqua ullamco pariatur magna.'),
        actions: [
          TextButton( onPressed: () => context.pop(), child: const Text('Cancelar')),

          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [const Text('lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),
            
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar dialogos')
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}