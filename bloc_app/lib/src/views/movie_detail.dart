import 'package:bloc_app/src/blocs/movies_bloc.dart';
import 'package:bloc_app/src/models/info_model.dart';
import 'package:bloc_app/src/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    moviesBloc.fetchSelectedMovie(id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Info'),
      ),
      body: StreamBuilder(
          stream: moviesBloc.selectedMovie,
          builder: (context, AsyncSnapshot<InfoModel> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  // Image.network(
                  //   'https://image.tmdb.org/t/p/w185${snapshot.data!.poster_path}',
                  //   // fit: BoxFit.cover,
                  // ),
                  (snapshot.data!.poster_path != null)
                      ? Image.network(
                          'https://image.tmdb.org/t/p/w185${snapshot.data!.poster_path}',
                          // fit: BoxFit.cover,
                        )
                      : Center(child: Text('이미지 준비중입니다')),
                  Text(snapshot.data!.title),
                  Text(snapshot.data!.overview),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
