import 'package:flutter/material.dart';
import 'package:lol_champions_app/app/controllers/champions_controller.dart';
import 'package:lol_champions_app/app/repositories/champions_repository_impl.dart';
import 'package:lol_champions_app/app/utils/colors_utils.dart';
import 'package:lol_champions_app/app/utils/img_utils.dart';
import 'package:lol_champions_app/app/utils/snack_bar_utils.dart';
import 'package:lol_champions_app/app/widgets/refresh_button_widget.dart';

import '../models/champion_model.dart';
import '../widgets/champion_card_widget.dart';

class ChampionsOverviewPage extends StatefulWidget {
  const ChampionsOverviewPage({super.key});

  @override
  State<ChampionsOverviewPage> createState() => _ChampionsOverviewPageState();
}

class _ChampionsOverviewPageState extends State<ChampionsOverviewPage> {
  final ChampionController _championsController = ChampionController(ChampionsRepositoryImpl());

  @override
  void initState() {
    super.initState();
    _championsController.getChampions().catchError((e) {
      SnackBarUtils.showSnackBarError(context, message: e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lol Champions', style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.bgPurple,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(IMG.BACKGROUND_IMAGE),
          ),
        ),
        child: ValueListenableBuilder<List<Champion>>(
          valueListenable: _championsController.champions,
          builder: (context, champions, __) {
            return champions.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Erro ao carregar os dados.', style: Theme.of(context).textTheme.headline6),
                      const SizedBox(height: 16.0),
                      RefreshButtonWidget(
                        onTap: () async {
                          _championsController.getChampions().catchError((e) {
                            SnackBarUtils.showSnackBarError(context, message: e.toString());
                          });
                        },
                      ),
                    ],
                  )
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: champions.length,
                    itemBuilder: (context, index) {
                      final champion = champions[index];

                      return ChampionCardWidget(champion: champion);
                    },
                  );
          },
        ),
      ),
    );
  }
}
