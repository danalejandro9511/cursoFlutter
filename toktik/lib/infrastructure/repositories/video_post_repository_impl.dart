

import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class VideoPostsImlRepository implements VideoPostsRepository {

  final VideoPostsDataSource videoPostDatasource;

  VideoPostsImlRepository({
    required this.videoPostDatasource
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPAge(int page) {
      return videoPostDatasource.getTrendingVideosByPAge(page);
  }
  
}