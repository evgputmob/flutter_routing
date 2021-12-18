import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing/utils/load_data.dart';
import 'package:routing/widgets/app_drawer.dart';
import '../constants.dart';

class ArtistsPage extends StatefulWidget {
  const ArtistsPage({Key? key}) : super(key: key);

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  late List<Artist> _artists;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    loadArtists().then((artistsList) => setState(() {
          _artists = artistsList;
          _loaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artists page'),
      ),
      drawer: const AppDrawer(),
      //-------------
      body: (!_loaded)
          ? const Center(child: Text('loading...'))
          : ListView(
              children: _artists.map((a) {
              return InkWell(
                onTap: () => context.push('${Routes.artists}/${a.link}'),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(a.name),
                ),
              );
            }).toList()),
    );
  }
}
