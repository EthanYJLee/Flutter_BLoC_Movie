import 'package:bloc_app/src/blocs/movies_bloc.dart';
import 'package:bloc_app/src/models/item_model.dart';
import 'package:bloc_app/src/views/movie_detail.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  late ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    moviesBloc.fetchAllMovies();
    return Scaffold(
      // StatefulWidget 대신 StreamBuilder를 사용해 View를 업데이트
      body: StreamBuilder(
        stream: moviesBloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            // return buildList(snapshot);
            return GridView.builder(
                shrinkWrap: true,
                controller: scrollController,
                itemCount: snapshot.data!.results.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    header: Text(
                      '${snapshot.data!.results[index].id}',
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MovieDetail(
                                id: snapshot.data!.results[index].id
                                    .toString())));
                      },
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w185${snapshot.data!.results[index].poster_path}',
                        // fit: BoxFit.cover,
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
  //   return GridView.builder(
  //       itemCount: snapshot.data?.results.length,
  //       gridDelegate:
  //           new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  //       itemBuilder: (BuildContext context, int index) {
  //         return Image.network(
  //           'https://image.tmdb.org/t/p/w185${snapshot.data?.results[index].poster_path}',
  //           fit: BoxFit.cover,
  //         );
  //       });
  // }
}
