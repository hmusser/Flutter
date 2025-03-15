import 'package:flutter/material.dart';
import 'package:toktik/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
//todo: cargar videos
    notifyListeners();
  }
}
