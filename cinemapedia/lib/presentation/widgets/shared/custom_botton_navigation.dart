import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottonNavigation extends StatelessWidget {

  final int currentIndex;
  const CustomBottonNavigation({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {

    /* int getCurrentIndex(BuildContext context){
      final int index = currentIndex;//GoRouterState.of(context).uri.toString();

      switch (index) {
        case 0:
          return 0;
        case 1:
          return 1;
        case 2:
          return 2;
        default:
          return 0;
      }
    } */

    void onItemTapped( BuildContext context, int index){
      switch (index) {
        case 0:
          context.go('/home/$index');
          break;
        case 1:
          context.go('/home/$index');
          break;
        case 2:
          context.go('/home/$index');
          break;
        default:
      }
    }


    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,//getCurrentIndex(context),
      onTap: (index){
        onItemTapped(context, index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_important_outline),
          label: 'Categorías'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos'
        ),
      ],
    );
  }
}