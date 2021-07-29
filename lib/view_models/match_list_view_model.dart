import 'package:flutter/cupertino.dart';
import 'package:football/models/football_team.dart';
import 'package:football/models/match.dart';
import 'package:football/services/web_service.dart';
import 'package:football/view_models/football_team_view_model.dart';
import 'package:football/view_models/match_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class MatchListViewModel extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;

  List<MatchViewModel> footballMatches = [];
  List<FootBallTeamViewModel> footballTeams = [];

  MatchListViewModel() {
    PopulateLists();
  }

  PopulateLists() async {
    await _populateMatches();
    await _populateTeam();
  }

  Future<void> _populateMatches() async {
    loadingStatus = LoadingStatus.searching;
    final List<Match> matches = await WebService().fetchMatches();
    this.footballMatches =
        matches.map((match) => MatchViewModel(match)).toList();

    loadingStatus =
        footballMatches.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> _populateTeam() async {
    loadingStatus = LoadingStatus.searching;
    final List<FootballTeam> teams = await WebService().fetchTeam();
    this.footballTeams =
        teams.map((team) => FootBallTeamViewModel(team)).toList();

    loadingStatus =
        footballTeams.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
