import 'package:flutter/material.dart';
import 'package:football/view_models/match_list_view_model.dart';
import 'package:football/widgets/match_list.dart';
import 'package:provider/provider.dart';

class WinningFootballTeam extends StatelessWidget {
  Widget _buildList(BuildContext context, MatchListViewModel games) {
    switch (games.loadingStatus) {
      case LoadingStatus.searching:
        return Align(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.empty:
        return Align(
          child: const Text('no results foound'),
        );
      case LoadingStatus.completed:
        return Expanded(
          child: MatchList(
            matches: games.footballMatches,
            footballTeams: games.footballTeams,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final games = Provider.of<MatchListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('who won the most games?'),
      ),
      body: Column(
        children: [
          _buildList(context, games),
        ],
      ),
    );
  }
}
