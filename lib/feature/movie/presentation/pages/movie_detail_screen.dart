import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movie/movie_bloc.dart';
import '../bloc/movie/movie_event.dart';
import '../bloc/movie/movie_state.dart';


class MovieDetailScreen extends StatefulWidget {
  final int movieId;

  MovieDetailScreen({required this.movieId});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailBloc>().add(GetMovieDetailEvent(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailLoaded) {
            final movie = state.movieDetail;
            return Stack(
              children: [
                SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (movie.tagline.isNotEmpty) ...[
                            SizedBox(height: 8),
                            Text(
                              '"${movie.tagline}"',
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 8.0,
                        children: [
                          Text('Rating: ${movie.voteAverage}/10'),
                          Text('Release Date: ${movie.releaseDate}'),
                          Text('Runtime: ${movie.runtime} min'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: movie.genres
                            .map((genre) => Chip(
                          label: Text(genre.name, style: Theme.of(context).textTheme.bodyMedium,),
                          backgroundColor: Color(0xFFB1060F),
                        ))
                            .toList(),
                      ),
                    ),

                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        movie.overview,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),

                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Budget: \$${movie.budget}'),
                          Text('Revenue: \$${movie.revenue}'),
                        ],
                      ),
                    ),

                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Production Companies:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: movie.productionCompanies.map((company) {
                              return Row(
                                children: [
                                  if (company.logoPath != null)
                                    Row(
                                      children: [Image.network(
                                        'https://image.tmdb.org/t/p/w500${company.logoPath}',
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.fitWidth,
                                      ),
                                        SizedBox(width: 10),
                                      ]
                                    ),

                                  Text(company.name),
                                  Spacer(),
                                  Text(company.originCountry),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 2,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.6),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

              ]
            );
          } else if (state is MovieDetailError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
