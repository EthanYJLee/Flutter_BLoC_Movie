// import 'dart:async';

// import 'package:bloc_app/src/blocs/search_bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class MovieSearch extends StatefulWidget {
//   const MovieSearch({super.key});

//   @override
//   State<MovieSearch> createState() => _MovieSearchState();
// }

// class _MovieSearchState extends State<MovieSearch> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // Bloc observing search textfield
//     searchBloc.checkText;
//     return Container(
//       child: StreamBuilder(
//           stream: searchBloc.search,
//           builder: (context, AsyncSnapshot<String> snapshot) {
//             return Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   height: 65,
//                   width: 300,
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: CupertinoTextField(
//                       controller: _searchController,
//                       onChanged: (value) => searchBloc.sinkSearch.add(value),
//                       keyboardType: TextInputType.text,
//                       decoration: const BoxDecoration(color: Colors.blueGrey),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 25),
//                   child: TextButton(
//                       onPressed: () {
//                         _searchController.text = "";
//                         FocusScope.of(context).unfocus();
//                       },
//                       child: const Text('cancel')),
//                 )
//               ],
//             );
//           }),
//     );
//   }
// }
