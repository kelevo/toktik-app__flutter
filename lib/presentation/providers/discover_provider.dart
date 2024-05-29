import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/domain/repositories/video_posts_repository.dart';
import 'package:toktik_app/infraestructure/models/local_video_model.dart';
import 'package:toktik_app/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {

  final VideoPostRepository videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videosRepository
  });

  Future<void> loadNextPage() async {

    // await Future.delayed(const Duration(seconds: 2));
    // final List<VideoPost> newVideos = videoPosts.map(
    //   (video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity()
    // ).toList();
    final newVideos = await videosRepository.getTrendingVideosByPage(1);
    
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }

}