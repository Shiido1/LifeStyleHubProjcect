import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import '../provider/_base_viewmodels.dart';

class VideoPlayer extends BaseViewModel {
  late BetterPlayerController betterPlayerController;
  late BetterPlayerDataSource _betterPlayerDataSource;
  late BetterPlayerConfiguration betterPlayerConfiguration;

  VideoPlayer() {
    _initializeVideoPlayer();
  }

  /// initialize video controller
  void _initializeVideoPlayer() {
    betterPlayerConfiguration = BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: false,
    );
  }

  /// play videos
  void playVideo(String link) {
    _betterPlayerDataSource =
        BetterPlayerDataSource(BetterPlayerDataSourceType.network, link);
    betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    betterPlayerController.setupDataSource(_betterPlayerDataSource);
  }

  @override
  void dispose() {
    betterPlayerController.dispose();
    super.dispose();
  }
}
