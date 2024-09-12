import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie_entities.dart';
import '../../domain/repository/movie_repository.dart';
import '../../domain/usecases/movie_usecases.dart';

import '../bloc/movie/movie_bloc.dart';
import '../pages/movie_detail_screen.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final movieRepository = RepositoryProvider.of<MovieRepository>(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => MovieDetailBloc(GetMovieDetail(movieRepository)),
              child: MovieDetailScreen(movieId: movie.id),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                height: 140,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Rating: ${movie.voteAverage}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
