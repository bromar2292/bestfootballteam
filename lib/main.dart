import 'package:flutter/material.dart';
import 'package:football/view_models/match_list_view_model.dart';
import 'package:football/views/winning_football_team.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

/// find which team won most matches is last 30 games
/// make sure it is responsive
/// write tests
///  make sure there is a loader
///  refactor
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MatchListViewModel(),
        child: WinningFootballTeam(),
      ),
    );
  }
}
