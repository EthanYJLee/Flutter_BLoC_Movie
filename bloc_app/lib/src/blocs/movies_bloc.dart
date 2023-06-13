import 'dart:async';

import 'package:bloc_app/src/models/info_model.dart';
import 'package:bloc_app/src/models/item_model.dart';
import 'package:bloc_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  // PublishSubject : 구독 (Subscribe) 이후의 데이터만 전송받을 수 있다.
  final _moviesFetcher = PublishSubject<ItemModel>();
  final _infoFetcher = PublishSubject<InfoModel>();
  final _searchFetcher = PublishSubject<ItemModel>();

  // fetch all movies and show them on main view (popular movie lists)
  Observable<ItemModel> get allMovies => _moviesFetcher.stream;
  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    // _moviesFetcher.stream.listen(print);  // Instance of 'ItemModel'
    _moviesFetcher.sink.add(itemModel);
    // _moviesFetcher.stream.listen(print);  // nothing will be printed here
  }

  // fetch infos about selected movie while movie's poster is tapped on main view
  Observable<InfoModel> get selectedMovie => _infoFetcher.stream;
  fetchSelectedMovie(String id) async {
    InfoModel infoModel = await _repository.fetchSelectedMovie(id);
    _infoFetcher.sink.add(infoModel);
  }

  // fetch movies while text is typped on search text field
  Observable<ItemModel> get searchedMovies => _searchFetcher.stream;
  fetchSearchedMovies(String search) async {
    ItemModel itemModel = await _repository.fetchSearchedMovies(search);
    _searchFetcher.sink.add(itemModel);
  }


  dispose() {
    _moviesFetcher.close();
    _infoFetcher.close();
    _searchFetcher.close();
  }
}

final moviesBloc = MoviesBloc();
