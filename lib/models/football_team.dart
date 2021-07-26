class FootballTeam {
  late String? name;
  late int? wins = 0;
  late String? crestUrl;

  FootballTeam({this.name, this.wins, this.crestUrl});

  factory FootballTeam.FromJSON(Map<String, dynamic> json) {
    return FootballTeam(
      name: json['name'],
      crestUrl: json['crestUrl'],
    );
  }

  updateWin(int newWin) {
    wins = newWin;
  }
}
