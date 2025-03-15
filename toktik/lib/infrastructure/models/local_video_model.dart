import 'package:toktik/entities/video_post.dart';

class LocalVideoModel {
  final String caption;
  final String videoUrl;
  final int likes;
  final int views;
  LocalVideoModel(
      {required this.caption,
      required this.videoUrl,
      required this.likes,
      required this.views});

  factory LocalVideoModel.fromJsonMap(Map<String, dynamic> json) =>
      LocalVideoModel(
          caption: json["caption"] ?? 'No video caption',
          videoUrl: json["videoUrl"],
          likes: json["likes"] ?? 0,
          views: json["views"] ?? 0);

  VideoPost toVideoPostEntity() => VideoPost(
      caption: caption, videoUrl: videoUrl, likes: likes, views: views);
}
