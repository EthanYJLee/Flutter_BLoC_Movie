import 'package:bloc_app/src/views/home.dart';
import 'package:bloc_app/src/views/movie_list.dart';
import 'package:bloc_app/src/views/movie_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: GestureDetector(
        // onTap: () => FocusScope.of(context).unfocus(),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Home(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
