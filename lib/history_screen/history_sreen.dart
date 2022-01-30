import 'package:arkham_horror_statistic/game_screen/new_game_screen.dart';
import 'package:arkham_horror_statistic/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_row_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var games = Provider.of<GameProvider>(context, listen: false).games;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Журнал игр'),
      ),
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return GameRow(games[index]);
        },
        shrinkWrap: true,
        itemCount: games.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        elevation: 0,
        onPressed: () => Navigator.of(context).pushNamed(NewGameScreen.routeName),
      ),
    );
  }
}
