import 'dart:convert';

import 'package:bloc_app/src/models/info_model.dart';
import 'package:bloc_app/src/models/item_model.dart';
import 'package:http/http.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '13014a189be582f0a3984247a19a3e23';

  Future<ItemModel> fetchMovieList() async {
    print("movie lists");
    final response = await client.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=ko-KR");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<InfoModel> fetchMovieInfo(String id) async {
    print("movie info");
    final response = await client.get(
        "https://api.themoviedb.org/3/movie/${id}?api_key=$_apiKey&language=ko-KR");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return InfoModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<ItemModel> fetchSearchedList(String search) async {
    print("searched results");
    final response = await client.get(
        "https://api.themoviedb.org/3/search/movie?api_key=${_apiKey}&query=${search}&language=ko-KR");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
