import 'package:flutter/material.dart';
import '../constants.dart';
import 'menu_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          SizedBox(height: 50),
          MenuItem(
            icon: Icons.home,
            text: 'Home',
            route: Routes.home,
          ),
          MenuItem(
            icon: Icons.library_music_sharp,
            text: 'Artists',
            route: Routes.artists,
          ),
        ],
      ),
    );
  }
}
