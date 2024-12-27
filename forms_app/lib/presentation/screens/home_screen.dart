import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Getor de estado'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            leading: const Icon(Icons.ac_unit),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text('Item 2'),
            leading: const Icon(Icons.access_alarm),
          ),
          ListTile(
            title: const Text('Item 3'),
            leading: const Icon(Icons.access_time),
          ),
        ],  
      ),
    );
  }
}