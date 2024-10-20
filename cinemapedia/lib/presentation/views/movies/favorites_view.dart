import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
   FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {

  @override
  void initState() {
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final favoritesMovies = ref.watch(favoriteMoviesProvider).values.toList();


    return Scaffold(
      body: ListView.builder(
          itemCount: favoritesMovies.length,
          itemBuilder: (context, index) {

            final movie = favoritesMovies[index];

            return ListTile(
              title: Text(movie.title),
            );
          },
      ),
    );
  }
}