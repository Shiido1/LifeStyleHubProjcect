import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:lifestyle_hub/provider/_base_viewmodels.dart';

class VideoPlayer extends BaseViewModel {
  late BetterPlayerController betterPlayerController;
  late BetterPlayerDataSource _betterPlayerDataSource;

  VideoPlayer() {
    _initializeVideoPlayer();
  }

  /// initialize video controller
  void _initializeVideoPlayer() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: false,
    );
    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    betterPlayerController.setupDataSource(_betterPlayerDataSource);
  }

  @override
  void dispose() {
    betterPlayerController.dispose();
    super.dispose();
  }
}
