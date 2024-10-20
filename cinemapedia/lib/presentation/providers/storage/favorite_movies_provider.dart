

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




final favoriteMoviesProvider = StateNotifierProvider<StorageMoviesNotifier,Map<int,Movie>>((ref) {
  final localStoragerepository = ref.watch(localStorageRepositoryProvider);

  return StorageMoviesNotifier(localStoragerepository: localStoragerepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  
  int page = 0;
  final LocalStorageRepository localStoragerepository;
  
  StorageMoviesNotifier({ required this.localStoragerepository }) : super({});

  Future<void> loadNextPage() async {
    
    final movies = await localStoragerepository.loadMovies(offset: page * 10);
    page++;
    
    final tempMoviesMap = <int, Movie>{};

    for( final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }

    state = {...state, ...tempMoviesMap};

  }



}