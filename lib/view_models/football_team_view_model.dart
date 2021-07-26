import 'package:flutter/material.dart';
import 'package:football/models/football_team.dart';

class FootBallTeamViewModel extends ChangeNotifier {
  late FootballTeam footballTeam;

  FootBallTeamViewModel(FootballTeam team) {
    this.footballTeam = team;
  }

  updateWins(int newWin) {
    this.footballTeam.updateWin(newWin);
  }

  get name {
    return this.footballTeam.name;
  }

  get url {
    return this.footballTeam.crestUrl;
  }

  get wins {
    return this.footballTeam.wins;
  }
}
