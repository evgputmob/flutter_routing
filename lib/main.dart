import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constants.dart';
import 'package:routing/pages/home_page.dart';
import 'package:routing/pages/artists_page.dart';
import 'package:routing/pages/artist_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Skillbox Module 7',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }

  final _router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: Routes.artists,
        builder: (context, state) => const ArtistsPage(),
        routes: [
          GoRoute(
            path: ':link',
            builder: (context, state) =>
                ArtistDetailsPage(link: state.params['link']),
          ),
        ],
      ),
    ],
  );
}
