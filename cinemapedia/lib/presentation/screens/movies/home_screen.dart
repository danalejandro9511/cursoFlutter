import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_botton_navigation.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read( nowPlanyingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
  }


  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return FullScreenLoader();

    final slidesShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlanyingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    
    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
            titlePadding: EdgeInsets.zero,
            centerTitle: false,
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index){
            return Column(
              children:[
                
                //const CustomAppbar(),
            
                MoviesSlideshow(movies: slidesShowMovies),
            
                MoviesHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En Cines',
                  subtitle: 'Viernes 20',
                  loadNextPage: () => ref.read(nowPlanyingMoviesProvider.notifier).loadNextPage(),
                ),
                
                MoviesHorizontalListview(
                  movies: upcomingMovies,
                  title: 'Próximamente',
                  subtitle: 'En este mes',
                  loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
                ),
                
                MoviesHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  //subtitle: 'En este mes',
                  loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
                ),
                
                
                MoviesHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Mejor calificadas',
                  subtitle: 'Desde siempre',
                  loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
                ),

                const SizedBox(height: 10),
                
              ],
            );
          },
          childCount: 1,
        ))

      ],

      
    );
  }
}