import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  

  Stream<String>getLoadingMessages() {
    final message = <String>[
      'Loading...',
      'Please wait...',
      'Almost there...',
      'Just a moment...',
      'Hold on...',
      'Just a sec...',
      'Loading data...',
    ];

    return Stream.periodic(const Duration(seconds: 1), (index) {
      return message[index];
    }).take(message.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Text('Loading...'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if( !snapshot.hasData ) return const Text('Cargando...');

              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}