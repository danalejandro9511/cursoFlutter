

import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageRepository {
    Future<void> toggleFavorite( Movie movie );

    Future<bool> isFavorite( int movieId );

    Future<List<Movie>> loadMovies({ int limit = 20, offset = 0 });
}