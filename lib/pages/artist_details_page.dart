import 'package:flutter/material.dart';
import 'package:routing/utils/load_data.dart';

class ArtistDetailsPage extends StatefulWidget {
  final String? link;
  const ArtistDetailsPage({Key? key, required this.link}) : super(key: key);

  @override
  State<ArtistDetailsPage> createState() => _ArtistDetailsPageState();
}

class _ArtistDetailsPageState extends State<ArtistDetailsPage> {
  bool _loaded = false;
  Artist? _selArtist;

  @override
  void initState() {
    super.initState();
    loadArtists().then((artistsList) => setState(() {
          _selArtist = null;
          for (var artist in artistsList) {
            if (artist.link == widget.link) {
              _selArtist = artist;
              break;
            }
          }
          _loaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (!_loaded)
            ? const Text('Artist details page')
            : ((_selArtist == null)
                ? const Text('Unknown artist')
                : Text(_selArtist!.name)),
      ),
      // drawer: const AppDrawer(),
      //-------------
      body: (!_loaded)
          ? const Center(child: Text('loading...'))
          : ((_selArtist == null)
              ? const Text('')
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Text(_selArtist!.about),
                )),
    );
  }
}
