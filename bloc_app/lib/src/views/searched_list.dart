import 'package:bloc_app/src/blocs/movies_bloc.dart';
import 'package:bloc_app/src/models/item_model.dart';
import 'package:bloc_app/src/views/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchedList extends StatelessWidget {
  SearchedList({super.key, required this.search});
  final String search;
  late ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    moviesBloc.fetchSearchedMovies(search);
    return Scaffold(
      body: StreamBuilder(
        stream: moviesBloc.searchedMovies,
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
                        child:
                            (snapshot.data!.results[index].poster_path != null)
                                ? Image.network(
                                    'https://image.tmdb.org/t/p/w185${snapshot.data!.results[index].poster_path}',
                                    // fit: BoxFit.cover,
                                  )
                                : Center(child: Text('이미지 준비중입니다'))),
                  );
                });
          } else if (snapshot.hasError) {
            // return Text(snapshot.error.toString());
            return Center(child: CircularProgressIndicator());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
