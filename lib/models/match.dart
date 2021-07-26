class Match {
  final String? winner;
  final String? homeTeam;
  final String? awayTeam;

  Match({
    this.winner,
    this.homeTeam,
    this.awayTeam,
  });

  factory Match.FromJSON(Map<String, dynamic> json) {
    return Match(
      winner: json['score']["winner"],
      homeTeam: json['homeTeam']['name'],
      awayTeam: json['awayTeam']['name'],
    );
  }
}
