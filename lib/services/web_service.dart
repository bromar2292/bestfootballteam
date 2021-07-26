import 'dart:convert';

import 'package:football/models/football_team.dart';
import 'package:football/models/match.dart';
import 'package:football/utils/constants.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<Match>> fetchMatches() async {
    final response = await http.get(Uri.parse(Constants.LIST_OF_MATCHES),
        headers: {'X-Auth-Token': Constants.API_KEY});

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['matches'];
      return list.map((json) => Match.FromJSON(json)).toList();
    } else {
      throw Exception('failed to get matches');
    }
  }

  Future<List<FootballTeam>> fetchTeam() async {
    final response = await http.get(Uri.parse(Constants.LIST_OF_TEAMS),
        headers: {'X-Auth-Token': Constants.API_KEY});

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['teams'];
      return list.map((json) => FootballTeam.FromJSON(json)).toList();
    } else {
      throw Exception('failed to get team');
    }
  }
}
