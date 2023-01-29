import 'package:flutter/material.dart';
import 'package:lol_champions_app/app/utils/colors_utils.dart';

import '../models/champion_model.dart';

class ChampionCardWidget extends StatelessWidget {
  const ChampionCardWidget({
    Key? key,
    required this.champion,
  }) : super(key: key);

  final Champion champion;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.bgPurple,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(champion.imageUrl),
            radius: 32,
          ),
          const SizedBox(height: 12.0),
          Text(
            champion.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 4.0),
          Text(
            champion.description,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
