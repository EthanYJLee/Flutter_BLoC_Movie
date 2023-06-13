class ItemModel {
  late int _page;
  late List<_Result> _results = [];
  late int _total_pages;
  late int _total_results;

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    _page = parsedJson['page'];

    // Result-----
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
    // -----Result

    _total_pages = parsedJson['total_pages'];
    _total_results = parsedJson['total_results'];
  }

  int get page => _page;
  List<_Result> get results => _results;
  int get total_pages => _total_pages;
  int get total_results => _total_results;
}

class _Result {
  late bool _adult;
  late String _backdrop_path;
  late List<int> _genre_ids = [];
  late int _id;
  late String _original_language;
  late String _original_title;
  late String _overview;
  late double _popularity;
  late String _poster_path;
  late String _release_date;
  late String _title;
  late bool _video;
  var _vote_average;
  late int _vote_count;

  _Result(result) {
    _adult = result['adult'];
    _backdrop_path = result['backdrop_path'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genre_ids.add(result['genre_ids'][i]);
    }
    _id = result['id'];
    _original_language = result['original_language'];
    _original_title = result['original_title'];
    _overview = result['overview'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _release_date = result['release_date'];
    _title = result['title'];
    _video = result['video'];
    _vote_average = result['vote_average'];
    _vote_count = result['vote_count'];
  }

  bool get adult => _adult;

  String get backdrop_path => _backdrop_path;

  List<int> get genre_ids => _genre_ids;

  int get id => _id;

  String get original_language => _original_language;

  String get original_title => _original_title;

  String get overview => _overview;

  double get popularity => _popularity;

  String get poster_path => _poster_path;

  String get release_date => _release_date;

  String get title => _title;

  bool get video => _video;

  double get vote_average => _vote_average;

  int get vote_count => _vote_count;
}
