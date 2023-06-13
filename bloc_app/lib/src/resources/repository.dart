import 'package:bloc_app/src/models/info_model.dart';
import 'package:bloc_app/src/models/item_model.dart';
import 'package:bloc_app/src/resources/movie_api_provider.dart';

// Repository : 데이터가 BLOC으로 전달되는 중심점
class Repository {
  final movieApiProvider = MovieApiProvider();
  Future<ItemModel> fetchAllMovies() => movieApiProvider.fetchMovieList();
  Future<InfoModel> fetchSelectedMovie([id]) =>
      movieApiProvider.fetchMovieInfo(id);

  Future<ItemModel> fetchSearchedMovies(search) =>
      movieApiProvider.fetchSearchedList(search);
}
