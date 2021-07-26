import 'package:flutter/cupertino.dart';
import 'package:football/models/match.dart';

class MatchViewModel extends ChangeNotifier {
  late Match eachMatch;
  late String resultWinner;

  MatchViewModel(Match match) {
    this.eachMatch = match;
  }

  String? get winner {
    return this.eachMatch.winner;
  }

  String? get homeTeam {
    return this.eachMatch.homeTeam;
  }

  String? get awayTeam {
    return this.eachMatch.awayTeam;
  }

  setWinner(String? homeTeam) {
    this.resultWinner = homeTeam!;
  }
}
