

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {

  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate( this.searchMovies);

  @override
  String get searchFieldLabel => 'Buscar peliculas';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [

      FadeIn(
        animate: query.isNotEmpty,
        child: IconButton(
          onPressed: () => query = '', 
          icon: const Icon( Icons.clear )
        ),
      )

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
      icon: const Icon( Icons.arrow_back_ios_new_rounded )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('BuildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: searchMovies(query), 
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }

          if(snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final movies = snapshot.data as List<Movie>;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index){
              return _MovieItem(movie: movies[index]);
            }
          );
        },
      );
  }

}

class _MovieItem extends StatelessWidget {

  final Movie movie;

  const _MovieItem({ required this.movie});

  @override
  Widget build(BuildContext context) {
      final textStyles = Theme.of(context).textTheme;
      final size = MediaQuery.of(context).size;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network( movie.posterPath ),
              ),
            ),

            const SizedBox( width: 10 ),

            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( movie.title, style: textStyles.titleMedium ),

                  ( movie.overview.length > 100 )
                    ? Text( '${movie.overview.substring(0,100)}...')
                    : Text( movie.overview ),

                  Row(
                    children: [
                      Icon( Icons.star_half_rounded, color: Colors.yellow.shade800 ),
                      const SizedBox( width: 5 ),
                      Text( 
                        HumanFormats.number( movie.voteAverage, 1),
                        style: textStyles.bodyMedium!.copyWith( color: Colors.yellow.shade800 ) 
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
  }
}