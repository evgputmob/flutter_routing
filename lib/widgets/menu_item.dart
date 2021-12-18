import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = (GoRouter.of(context).location == route);

    return ListTile(
        leading: Icon(
          icon,
          color: isSelected ? (Colors.blueAccent) : (Colors.black),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? (Colors.blueAccent) : (Colors.black),
          ),
        ),
        trailing: isSelected
            ? (null)
            : (const Icon(
                Icons.chevron_right,
                color: Colors.black,
              )),
        onTap: isSelected
            ? (null)
            : () {
                // Закрываем Drawer
                Scaffold.of(context).openEndDrawer();
                // Переходим по маршруту и вносим страницу в стек навигации
                context.push(route);
                //
                //context.go(route); // <- не вносит страницу в стек навигации
              });
  }
}
