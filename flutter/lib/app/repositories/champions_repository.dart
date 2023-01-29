import 'package:lol_champions_app/app/models/champion_model.dart';

abstract class ChampionsRepository {
  Future<List<Champion>> getChampions();
}
