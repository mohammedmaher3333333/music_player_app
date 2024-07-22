import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayerModel extends ChangeNotifier {
  final _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _isShuffled = false;
  int _currentTrackIndex = 0;
  final List<String> _tracks = [
    'sound/toy-story.mp3',
    'sound/space.mp3',
    'sound/stomp.mp3',
  ];

  bool get isPlaying => _isPlaying;
  bool get isShuffled => _isShuffled;
  List<String> get tracks => _tracks;
  String get currentTrack => _tracks[_currentTrackIndex].split('/').last;

  MusicPlayerModel() {
    _audioPlayer.onPlayerComplete.listen((_) {
      if (_isPlaying) {
        nextTrack();
      }
    });
  }

  void togglePlayPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(AssetSource(_tracks[_currentTrackIndex]));
    }
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void nextTrack() {
    if (_isShuffled) {
      _currentTrackIndex = _getRandomTrackIndex();
    } else {
      _currentTrackIndex = (_currentTrackIndex + 1) % _tracks.length;
    }
    _audioPlayer.play(AssetSource(_tracks[_currentTrackIndex]));
    _isPlaying = true;
    notifyListeners();
  }

  void previousTrack() {
    _currentTrackIndex = (_currentTrackIndex - 1 + _tracks.length) % _tracks.length;
    _audioPlayer.play(AssetSource(_tracks[_currentTrackIndex]));
    _isPlaying = true;
    notifyListeners();
  }

  void toggleShuffle() {
    _isShuffled = !_isShuffled;
    notifyListeners();
  }

  void setTrackIndex(int index) {
    _currentTrackIndex = index;
    _audioPlayer.play(AssetSource(_tracks[_currentTrackIndex]));
    _isPlaying = true;
    notifyListeners();
  }

  int _getRandomTrackIndex() {
    final random = Random();
    return random.nextInt(_tracks.length);
  }
}
