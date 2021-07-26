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
    sortMatches.Call(widget.matches);
    sortTeams.Call(widget.matches, widget.footballTeams);
  }

  @override
  void initState() {
    findWinners();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
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
