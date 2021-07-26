import 'package:flutter_test/flutter_test.dart';
import 'package:football/models/match.dart';
import 'package:football/view_models/match_view_model.dart';

void main() {
  List<Match> matches = [
    Match(winner: 'DRAW', homeTeam: 'arsnal', awayTeam: 'liverpool'),
    Match(winner: 'HOME_TEAM', homeTeam: 'arsnal', awayTeam: 'liverpool'),
    Match(winner: 'AWAY_TEAM', homeTeam: 'arsnal', awayTeam: 'liverpool'),
    Match(winner: 'DRAW', homeTeam: 'arsnal', awayTeam: 'liverpool'),
  ];

  List<Match> matchTestWIn = [
    Match(winner: 'HOME_TEAM', homeTeam: 'arsnal', awayTeam: 'liverpool'),
    Match(winner: 'AWAY_TEAM', homeTeam: 'arsnal', awayTeam: 'liverpool'),
  ];

  List<MatchViewModel> ViewModelMatches =
      matches.map((match) => MatchViewModel(match)).toList();

  List<MatchViewModel> ViewModelMatch =
      matchTestWIn.map((match) => MatchViewModel(match)).toList();

  test('remove draws from list', () {
    ViewModelMatches.removeWhere((element) => element.winner == 'DRAW');
    expect(ViewModelMatches.contains('DRAW'), false);
  });

  test('winner should be set to arsnal', () {
    ViewModelMatch.forEach(
      (match) {
        if (match.winner == 'HOME_TEAM') {
          match.setWinner(match.homeTeam);
        }
        if (match.winner == 'AWAY_TEAM') {
          match.setWinner(match.awayTeam);
        }
        print('hello');
      },
    );

    expect(ViewModelMatch[0].resultWinner, 'arsnal');
  });
  test('winner should be set to liverpool', () {
    ViewModelMatch.forEach(
      (match) {
        if (match.winner == 'HOME_TEAM') {
          match.setWinner(match.homeTeam);
        }
        if (match.winner == 'AWAY_TEAM') {
          match.setWinner(match.awayTeam);
        }
      },
    );

    expect(ViewModelMatch[1].resultWinner, 'liverpool');
  });
}
