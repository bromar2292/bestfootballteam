import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football/use_cases/sort_matches.dart';
import 'package:football/use_cases/sort_teams.dart';
import 'package:football/view_models/football_team_view_model.dart';
import 'package:football/view_models/match_view_model.dart';

/// write tests

class MatchList extends StatefulWidget {
  final List<MatchViewModel> matches;
  final List<FootBallTeamViewModel> footballTeams;

  MatchList({required this.matches, required this.footballTeams});

  @override
  _MatchListState createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  SortMatches sortMatches = SortMatches();

  SortTeams sortTeams = SortTeams();

  void findWinners() {
    /// function removes the draws, then assignes the winning team to resultsWinner
    sortMatches.Call(widget.matches);

    /// function creates a new list of teams that won
    /// then creates a new object of how many times each team won
    /// then transfers the information to footballteamlist which has the crest url and team data
    sortTeams.Call(widget.matches, widget.footballTeams);
  }

  @override
  void initState() {
    findWinners();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      /// can change item count to see bigger or smaller lists
      itemCount: 5,
      itemBuilder: (context, index) {
        final match = widget.footballTeams[index];

        return ListTile(
          onTap: () {},
          leading: Container(
            height: 205,
            width: 100,
            child: SvgPicture.network(
              match.url as String,
              semanticsLabel: 'Feed button',
              placeholderBuilder: (context) => Icon(Icons.error),
            ),
          ),
          title: Text(match.name as String),
          subtitle: Text('${match.wins} games won '),
        );
      },
    );
  }
}
