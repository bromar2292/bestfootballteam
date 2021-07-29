import 'package:flutter_test/flutter_test.dart';
import 'package:football/models/football_team.dart';
import 'package:football/models/match.dart';
import 'package:football/use_cases/sort_matches.dart';
import 'package:football/view_models/football_team_view_model.dart';
import 'package:football/view_models/match_view_model.dart';

void main() {
  List<String> games = [];
  SortMatches sortMatches = SortMatches();
  var newMap = Map();

  List<Match> matches = [
    Match(winner: 'HOME_TEAM', homeTeam: 'arsnal', awayTeam: 'liverpool'),
    Match(winner: 'HOME_TEAM', homeTeam: 'arsnal', awayTeam: 'liverpool'),
    Match(winner: 'AWAY_TEAM', homeTeam: 'arsnal', awayTeam: 'liverpool'),
    Match(winner: 'HOME_TEAM', homeTeam: 'arsnal', awayTeam: 'liverpool'),
  ];

  List<FootballTeam> footballTeams = [
    FootballTeam(name: 'arsnal', wins: 0, crestUrl: 'test'),
    FootballTeam(name: 'liverpool', wins: 0, crestUrl: 'test'),
  ];

  List<MatchViewModel> ViewModelMatches =
      matches.map((match) => MatchViewModel(match)).toList();

  /// this function sorts the matches and gives a winner
  sortMatches.Call(ViewModelMatches);

  List<FootBallTeamViewModel> ViewModelTeam =
      footballTeams.map((match) => FootBallTeamViewModel(match)).toList();

  test('create list of winning teams that has length of 4', () {
    ViewModelMatches.forEach(
      (element) {
        games.add(element.resultWinner);
      },
    );
    expect(games.length, 4);
  });

  test(
      'counts how many times a team has won so this should show that arsnal has won 3 times',
      () {
    games.forEach(
      (element) {
        if (!newMap.containsKey(element)) {
          newMap[element] = 1;
        } else {
          newMap[element] += 1;
        }
      },
    );
    expect(newMap.entries.first.value, 3);
  });

  test('creates a new list and updates wins the new list should return wins= 3',
      () {
    newMap.entries.forEach(
      (matchWinner) {
        ViewModelTeam.forEach(
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
    expect(ViewModelTeam[0].wins, 3);
  });
}
