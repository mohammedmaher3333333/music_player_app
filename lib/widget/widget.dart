import 'package:flutter/material.dart';
import 'package:music_player_app/music_player_model.dart';
import 'package:provider/provider.dart';

void showPlaylist(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Playlist',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<MusicPlayerModel>().tracks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(context.watch<MusicPlayerModel>().tracks[index].split('/').last),
                    onTap: () {
                      context.read<MusicPlayerModel>().setTrackIndex(index);
                      Navigator.pop(context); // Close the bottom sheet after selecting a track
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
