import 'dart:ffi';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_by_movie_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {

  static const name = 'movie-screen';

  final String movieId; 

  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {

  @override
  void initState() {
    super.initState();

    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);


  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

    if(movie == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Add a return statement here
    return Scaffold(
      
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers:[
          _CustomSliverAppBar(movie: movie),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => _MovieDetails(movie: movie),
            childCount: 1
          ),)
        ]
      ),
    ); // Replace Container() with the appropriate widget you want to return.
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;
  const _MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              
              //Imagen
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width * 0.3,
                ),
              ),

              const SizedBox(width: 10),

              //Descripcion
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(
                      movie.title,
                      style: textStyles.titleLarge,
                    ),
                    Text(
                      movie.overview,
                     
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...movie.genreIds.map((gender) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip(
                  label: Text( gender ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ))
            ],
          )
        ),

        _ActorsByMovie(movieId: movie.id.toString()),

        const SizedBox(height: 50),
      ],
    );
  }
}

class _ActorsByMovie extends ConsumerWidget {

  final String movieId;

  const _ActorsByMovie({ required this.movieId });

  @override
  Widget build(BuildContext context, ref) {

    final actorsByMovie = ref.watch(actorsByMovieProvider);

    if(actorsByMovie[movieId] == null){
      return const CircularProgressIndicator(strokeWidth: 2);
    }

    final actors = actorsByMovie[movieId]!;

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index){
          final actor = actors[index];

          return Container(
            padding: const EdgeInsets.all(8.0),
            width: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    actor.profilePath,
                    width: 180,
                    height: 135,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 5),

                Text(actors[index].name, maxLines: 2),

                Text(actor.character ?? '', maxLines: 2, style: const TextStyle( fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis ),),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {

  final Movie movie;  

  const _CustomSliverAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.favorite_border),
          //icon: const Icon(Icons.favorite_rounded, color: Colors.red,),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        /* title: Text(
          movie.title,
          style: const TextStyle( fontSize: 20 ),
          textAlign: TextAlign.start,
        ), */
        background: Stack(
          children: [

            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress){
                  if(loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),

            const _CustomGradient(begin: Alignment.topRight, stops: [0.0, 0.2], colors: [Colors.black54, Colors.transparent], end: Alignment.bottomLeft),
            
            const _CustomGradient(begin: Alignment.topCenter, stops: [0.7, 1.0], colors: [Colors.transparent, Colors.black87], end: Alignment.bottomCenter),

            const _CustomGradient(begin: Alignment.topLeft, stops: [0.0, 0.3], colors: [Colors.black87, Colors.transparent]),

          ],
        ), 
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  final Alignment begin;
  final Alignment? end;
  final List<double> stops;
  final List<Color> colors;

  const _CustomGradient({required this.begin, required this.stops, required this.colors, this.end});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end ?? Alignment.bottomRight,
            stops: stops,
            colors: colors,
          ),
        ),
      ),
    );
  }
}