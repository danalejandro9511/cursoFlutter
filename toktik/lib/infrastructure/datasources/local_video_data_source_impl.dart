


import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';

import '../../shared/data/local_video_post.dart';

class LocalVideosDataSource implements VideoPostsDataSource{

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPAge(int page) async{
    
    await Future.delayed( const Duration(seconds:2) );

    final List<VideoPost> newVideos = videoPosts.map( 
      ( video ) => VideoPostModel.fromJson(video).toVideoPostEntity() 
    ).toList();

    return newVideos;

    
  }



}
