class InfoModel {
  late bool _adult;
  late String _backdrop_path;
  //** Belongs To Collection {} (시리즈)
  late int _collection_id = 0;
  late String _collection_name = '';
  late String _collection_poster_path = '';
  late String _collection_backdrop_path = '';
  // */
  late int _budget;
  late List<_Genres> _genres = [];
  late String _homepage;
  late int _id;
  late int _imdb_id;
  late String _original_language;
  late String _original_title;
  late String _overview;
  late double _popularity;
  late String _poster_path;
  late List<_ProductionCompanies> _production_companies = [];
  late List<_ProductionCountries> _production_countries = [];
  late String _release_date;
  late int _revenue;
  late int _runtime;
  late List<_SpokenLanguages> _spoken_languages = [];
  late String _status;
  late String _tagline;
  late String _title;
  late bool _video;
  late double _vote_average;
  late int _vote_count;

  InfoModel.fromJson(Map<String, dynamic> parsedJson) {
    _adult = parsedJson['_adult'];
    _backdrop_path = parsedJson['backdrop_path'];
    // Belongs To Collection (시리즈 유무 판별)
    if (parsedJson['belongs_to_collection'] != null) {
      _collection_id = parsedJson['belongs_to_collection'][0];
      _collection_name = parsedJson['belongs_to_collection'][1];
      _collection_poster_path = parsedJson['belongs_to_collection'][2];
      _collection_backdrop_path = parsedJson['belongs_to_collection'][3];
    }
    _budget = parsedJson['budget'];

    // Genres-----
    List<_Genres> tempGenres = [];
    for (int i = 0; i < parsedJson['genres'].length; i++) {
      _Genres genres = _Genres(parsedJson['genres'][i]);
      tempGenres.add(genres);
    }
    _genres = genres;
    // -----Genres

    _homepage = parsedJson['homepage'];
    _id = parsedJson['id'];
    _imdb_id = parsedJson['id'];
    _original_language = parsedJson['original_language'];
    _original_title = parsedJson['original_title'];
    _overview = parsedJson['overview'];
    _popularity = parsedJson['popularity'];
    _poster_path = parsedJson['poster_path'];

    // Production Companies-----
    List<_ProductionCompanies> tempProductionCompanies = [];
    for (int i = 0; i < parsedJson['production_companies'].length; i++) {
      _ProductionCompanies productionCompanies =
          _ProductionCompanies(parsedJson['production_companies'][i]);
      tempProductionCompanies.add(productionCompanies);
    }
    _production_companies = production_companies;
    // -----Production Companies

    // Production Countries-----
    List<_ProductionCountries> tempProductionCountries = [];
    for (int i = 0; i < parsedJson['production_countries'].length; i++) {
      _ProductionCountries productionCountries =
          _ProductionCountries(parsedJson['production_countries'][i]);
      tempProductionCountries.add(productionCountries);
    }
    _production_countries = production_countries;
    // -----Production Countries

    _release_date = parsedJson['release_date'];
    _revenue = parsedJson['revenue'];
    _runtime = parsedJson['runtime'];

    // Spoken Lauguages-----
    List<_SpokenLanguages> tempSpokenLanguages = [];
    for (int i = 0; i < parsedJson['spoken_languages'].length; i++) {
      _SpokenLanguages spokenLanguages =
          _SpokenLanguages(parsedJson['spoken_languages'][i]);
      tempSpokenLanguages.add(spokenLanguages);
    }
    _spoken_languages = spoken_languages;
    // -----Spoken Languages

    _status = parsedJson['status'];
    _tagline = parsedJson['tagline'];
    _title = parsedJson['title'];
    _video = parsedJson['video'];
    _vote_average = parsedJson['vote_average'];
    _vote_count = parsedJson['vote_count'];
  }

  bool get adult => _adult;

  int get collectionId => _collection_id;

  String get collectionName => _collection_name;

  String get collectionPosterPath => _collection_poster_path;

  String get collectionBackdropPath => _collection_backdrop_path;

  int get budget => _budget;

  List<_Genres> get genres => _genres;

  String get homepage => _homepage;

  int get id => _id;

  int get imdb_id => _imdb_id;

  String get original_language => _original_language;

  String get original_title => _original_title;

  String get overview => _overview;

  double get popularity => _popularity;

  String get poster_path => _poster_path;

  List<_ProductionCompanies> get production_companies => _production_companies;

  List<_ProductionCountries> get production_countries => _production_countries;

  String get release_date => _release_date;

  int get revenue => _revenue;

  int get runtime => _runtime;

  List<_SpokenLanguages> get spoken_languages => _spoken_languages;

  String get status => _status;

  String get tagline => _tagline;

  String get title => _title;

  bool get video => _video;

  double get vote_average => _vote_average;

  int get vote_count => _vote_count;
}

class _Genres {
  late int _id;
  late String _name;

  _Genres(genres) {
    _id = genres['id'];
    _name = genres['name'];
  }
}

class _ProductionCompanies {
  late int _id;
  late String _logo_path;
  late String _name;
  late String _origin_country;

  _ProductionCompanies(productionCompanies) {
    _id = productionCompanies['id'];
    _logo_path = productionCompanies['logo_path'];
    _name = productionCompanies['name'];
    _origin_country = productionCompanies['origin_country'];
  }
}

class _ProductionCountries {
  late String _iso_3166_1;
  late String _name;

  _ProductionCountries(productionCountries) {
    _iso_3166_1 = productionCountries['iso_3166_1'];
    _name = productionCountries['name'];
  }
}

class _SpokenLanguages {
  late String _english_name;
  late String _iso_639_1;
  late String _name;

  _SpokenLanguages(spokenLanguages) {
    _english_name = spokenLanguages['english_name'];
    _iso_639_1 = spokenLanguages['iso_639_1'];
    _name = spokenLanguages['name'];
  }
}
