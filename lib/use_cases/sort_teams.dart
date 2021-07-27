import 'package:football/view_models/football_team_view_model.dart';
import 'package:football/view_models/match_view_model.dart';

class SortTeams {
  void Call(

      /// function creates a new list of teams that won
      List<MatchViewModel> matches,
      List<FootBallTeamViewModel> footballTeams) {
    List<String> games = [];
    matches.forEach(
      (match) {
        games.add(match.resultWinner);
      },
    );

    /// then creates a new object of how many times each team won
    var newMap = Map();

    games.forEach(
      (element) {
        if (!newMap.containsKey(element)) {
          newMap[element] = 1;
        } else {
          newMap[element] += 1;
        }
      },
    );

    /// then transfers the information to footballteamlist which has the crest url and team data
    newMap.entries.forEach(
      (matchWinner) {
        footballTeams.forEach(
          (team) {
            if (team.name == matchWinner.key) {
              team.updateWins(matchWinner.value as int);
            }
            if (team.wins == null) {
              team.updateWins(0);
            }
          },
        );
      },
    );

    /// sorts the info in order
    footballTeams.sort((b, a) => a.wins.compareTo(b.wins));
  }
}
