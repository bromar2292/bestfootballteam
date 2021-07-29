class FootballTeam {
  String name;

  int wins;

  String crestUrl;

  FootballTeam({
    required this.name,
    this.wins = 0,
    required this.crestUrl,
  });

  factory FootballTeam.FromJSON(Map<String, dynamic> json) {
    return FootballTeam(
      name: json['name'],
      crestUrl: json['crestUrl'] ?? '',
    );
  }

  updateWin(int newWin) {
    wins = newWin;
  }
}
