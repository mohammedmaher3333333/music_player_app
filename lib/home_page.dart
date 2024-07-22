import 'package:flutter/material.dart';
import 'package:music_player_app/widget/widget.dart';
import 'package:provider/provider.dart';
import 'music_player_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
        actions: [
          IconButton(
            icon: const Icon(Icons.playlist_play,size: 50,),
            onPressed: () => showPlaylist(context),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              // Border color and width
              shape: BoxShape.circle, // Make the container circular
            ),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                // Border color and width
                shape: BoxShape.circle, // Make the container circular
              ),
              child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 70,
                  )),
            ),
          ),
          const SizedBox(height: 20,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(backgroundColor: Colors.black,radius: 5,),SizedBox(width: 5,),
              CircleAvatar(backgroundColor: Colors.black,radius: 5,),SizedBox(width: 5,),
              CircleAvatar(backgroundColor: Colors.black,radius: 5,),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            context.watch<MusicPlayerModel>().currentTrack,
            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 60,),
              IconButton(
                icon: const Icon(Icons.skip_previous,
                  size: 30,),
                onPressed: () {
                  context.read<MusicPlayerModel>().previousTrack();
                },
              ),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 30,
                child: IconButton(
                  icon: Icon(
                    context.watch<MusicPlayerModel>().isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    context.read<MusicPlayerModel>().togglePlayPause();
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.skip_next,
                  size: 30,),
                onPressed: () {
                  context.read<MusicPlayerModel>().nextTrack();
                },
              ),
              IconButton(
                icon: Icon(context.watch<MusicPlayerModel>().isShuffled
                    ? Icons.shuffle_on
                    : Icons.shuffle,
                size: 30,),
                onPressed: () {
                  context.read<MusicPlayerModel>().toggleShuffle();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
