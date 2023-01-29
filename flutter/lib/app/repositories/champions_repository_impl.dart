import 'dart:convert';

import 'package:lol_champions_app/app/models/champion_model.dart';
import 'package:lol_champions_app/app/repositories/champions_repository.dart';
import 'package:http/http.dart' as http;
import 'package:lol_champions_app/app/utils/api_utils.dart';

class ChampionsRepositoryImpl implements ChampionsRepository {
  @override
  Future<List<Champion>> getChampions() async {
    List<Champion> champions = [];

    var response = await http.get(Uri.parse(API.REQUEST_CHAMPIONS_URL));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;

      for (var element in data) {
        champions.add(Champion.fromJson(element));
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return champions;
  }
}
