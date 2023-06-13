import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

// 검색어가 입력될 때 해당되는 데이터를 불러오기 위한 클래스
class SearchBloc {
  // Field validates search text field on main view
  final _search = BehaviorSubject<String>(seedValue: "");
  // Stream and Sink
  Stream<String> get search => _search.stream.transform(checkText);
  Sink<String> get sinkSearch => _search.sink;

  final checkText = StreamTransformer<String, String>.fromHandlers(
      handleData: (String value, EventSink<String> sink) {
    if (value != "") {
      print(value);
    }
  });
}

final searchBloc = SearchBloc();
