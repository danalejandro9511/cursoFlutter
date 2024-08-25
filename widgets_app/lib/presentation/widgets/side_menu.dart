import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMnu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMnu({super.key, required this.scaffoldKey});

  @override
  State<SideMnu> createState() => _SideMnuState();
}

class _SideMnuState extends State<SideMnu> {

  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (int index){
        setState(() {
          navDrawerIndex = index;
        });

        final menuItem = appMenuItems[index];

        context.push( menuItem.link );
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Flutter + Material 3')
        ),
        ...appMenuItems
          .sublist(0,3)
          .map((item) => NavigationDrawerDestination(
              icon: Icon( item.icon ),
              label: Text(item.title)
            ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28,16,28,10),
          child: Divider(),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Mas opciones')
        ),
        ...appMenuItems
          .sublist(3)
          .map((item) => NavigationDrawerDestination(
              icon: Icon( item.icon ),
              label: Text(item.title)
            ),
        ),
      ]
    );
  }
}