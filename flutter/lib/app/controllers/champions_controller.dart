import 'package:flutter/cupertino.dart';
import 'package:lol_champions_app/app/models/champion_model.dart';
import 'package:lol_champions_app/app/repositories/champions_repository.dart';

import '../exceptions/http_exceptions.dart';

class ChampionController {
  final ChampionsRepository _championsRepository;

  ChampionController(this._championsRepository);

  ValueNotifier<List<Champion>> champions = ValueNotifier<List<Champion>>([]);

  Future<void> getChampions() async {
    try {
      champions.value = await _championsRepository.getChampions();
    } catch (e) {
      throw HttpExceptions(e.toString());
    }
  }
}
