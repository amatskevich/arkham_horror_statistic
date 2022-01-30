import 'package:arkham_horror_statistic/models/game.dart';
import 'package:arkham_horror_statistic/models/game_status.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class GameRow extends StatelessWidget {
  final Game game;

  const GameRow(this.game, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ru_RU', null);
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black),
        ],
      ),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    game.ancient,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    DateFormat('E, d MMMM yyyy', 'ru_RU').format(game.date),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          _determinateIcon(game.status),
        ],
      ),
    );
  }

  Icon _determinateIcon(GameStatus status) {
    const size = 30.0;
    switch (status) {
      case GameStatus.win:
        return const Icon(
          Icons.check_circle_outlined,
          color: Colors.blueGrey,
          size: size,
        );
      case GameStatus.dead:
        return const Icon(
          Icons.cancel_outlined,
          color: Colors.red,
          size: size,
        );
      case GameStatus.inProgress:
        return const Icon(
          Icons.cached_outlined,
          color: Colors.yellow,
          size: size,
        );
    }
  }
}
