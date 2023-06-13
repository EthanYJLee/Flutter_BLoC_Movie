import 'package:bloc_app/src/blocs/search_bloc.dart';
import 'package:bloc_app/src/views/movie_list.dart';
import 'package:bloc_app/src/views/searched_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    searchBloc.checkText;
    return Scaffold(
      appBar: AppBar(
        title: (_searchController.text == "")
            ? Text('Popular Movies')
            : Text('Results'),
      ),
      body: Center(
        child: Column(
          children: [
            // 검색어 TextField
            StreamBuilder(
                stream: searchBloc.search,
                builder: (context, AsyncSnapshot<String> snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 65,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CupertinoTextField(
                            controller: _searchController,
                            onChanged: (value) {
                              searchBloc.sinkSearch.add(value);
                              setState(() {});
                            },
                            keyboardType: TextInputType.text,
                            decoration:
                                const BoxDecoration(color: Colors.blueGrey),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: TextButton(
                            onPressed: () {
                              _searchController.text = "";
                              FocusScope.of(context).unfocus();
                              setState(() {});
                            },
                            child: const Text('cancel')),
                      )
                    ],
                  );
                }),
            Expanded(
              child: (_searchController.text == "")
                  ? MovieList()
                  : SearchedList(search: _searchController.text),
            ),
          ],
        ),
      ),
    );
  }
}
