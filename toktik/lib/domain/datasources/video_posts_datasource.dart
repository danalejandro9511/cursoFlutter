

import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostsDataSource {

  Future<List<VideoPost>> getFavoriteVideosByUser( String userID );
  
  Future<List<VideoPost>> getTrendingVideosByPAge( int page );


}