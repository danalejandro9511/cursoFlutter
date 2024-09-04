



import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDataSource{

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));

  List<Actor> _jsonToCast( Map<String,dynamic> json){

    final moviedbResponse = CreditsResponse.fromJson(json);

    final List<Actor> movies = moviedbResponse.cast
    .where((moviedb) => moviedb.profilePath != 'no-poster')
    .map(
      (moviedb) => ActorMapper.castToEntity(moviedb)  ).toList();

    return movies;
  }

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{

    final response = await dio.get('/movie/$movieId/credits');

    if(response.statusCode != 200) throw Exception('Error al obtener el cast');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map((cast) => ActorMapper.castToEntity(cast)).toList();

    return actors;
  }
}