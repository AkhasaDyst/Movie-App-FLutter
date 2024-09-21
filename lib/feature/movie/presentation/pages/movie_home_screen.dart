import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie_entities.dart';
import '../../domain/repository/movie_repository.dart';
import '../../domain/usecases/movie_usecases.dart';

import '../bloc/movie/movie_bloc.dart';
import '../bloc/movie/movie_event.dart';
import '../bloc/movie/movie_state.dart';
import '../widgets/movie_item.dart';
import 'movie_detail_screen.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(GetPopularMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    int crossAxisCount = screenWidth > 1400 ? 6
        : screenWidth > 1200 ? 5
        : screenWidth > 900 ? 4
        : screenWidth > 600 ? 3
        : 1;

    return Scaffold(
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieLoaded) {
            return kIsWeb || screenWidth > 600
                ? GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: screenWidth > 600 ? 0.6 : 3.3,
              ),
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return MovieItem(movie: movie);
              },
            )
                : ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                if (index == 0) {
                  return _buildFeaturedMovie(context, movie);
                } else {
                  return MovieItem(movie: movie);
                }
              },
            );
          } else if (state is MovieError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No movies available.'));
        },
      ),
    );
  }

  Widget _buildFeaturedMovie(BuildContext context, Movie movie) {
    return Stack(
      children: [
        GestureDetector(
          child: Stack(
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 60.0.h,
              ),
              Container(
                width: double.infinity,
                height: 60.0.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0d253f).withOpacity(1.0),
                      Colors.transparent,
                      Colors.transparent,
                      Color(0xFF0d253f).withOpacity(1.0),
                    ],
                    stops: [0.0, 0.4, 0.6, 1.0],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        movie.title,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'Rating: ${movie.voteAverage}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            final movieRepository =
            RepositoryProvider.of<MovieRepository>(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) =>
                      MovieDetailBloc(GetMovieDetail(movieRepository)),
                  child: MovieDetailScreen(movieId: movie.id),
                ),
              ),
            );
          },
        ),
        _buildTopButtons(context),
      ],
    );
  }

  Widget _buildTopButtons(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              BlocProvider.of<MovieBloc>(context)
                  .add(GetPopularMoviesEvent());
            },
            child: Text('Popular',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          SizedBox(width: 8),
          TextButton(
            onPressed: () {
              BlocProvider.of<MovieBloc>(context)
                  .add(GetNowPlayingMoviesEvent());
            },
            child: Text('Now Playing',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          SizedBox(width: 8),
          TextButton(
            onPressed: () {
              BlocProvider.of<MovieBloc>(context)
                  .add(GetTopRatedMoviesEvent());
            },
            child: Text('Top Rated',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
