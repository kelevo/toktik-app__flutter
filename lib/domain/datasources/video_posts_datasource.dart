import 'package:toktik_app/domain/entities/video_post.dart';

abstract class VideoPostDatasource {

  Future<List<VideoPost>> getFavoriteVideosByUser(int userID);

  Future<List<VideoPost>> getTrendingVideosByPage(int page);

}