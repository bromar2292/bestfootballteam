import 'package:football/view_models/match_view_model.dart';

class SortMatches {
  void Call(List<MatchViewModel> matches) {
    matches.removeWhere((element) => element.winner == 'DRAW');

    matches.forEach(
      (match) {
        if (match.winner == 'HOME_TEAM') {
          match.setWinner(match.homeTeam);
        }
        if (match.winner == 'AWAY_TEAM') {
          match.setWinner(match.awayTeam);
        }
      },
    );
  }
}
