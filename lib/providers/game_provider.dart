import 'package:arkham_horror_statistic/models/game.dart';
import 'package:arkham_horror_statistic/models/game_status.dart';
import 'package:flutter/material.dart';

import 'game_data_provider.dart';

class GameProvider with ChangeNotifier {
  final List<Game> _games = [
    Game('3', ancient: Ancient("Ктулху", 0), date: DateTime.now()),
    Game('2', ancient: Ancient("Азатот", 0), date: DateTime(2022, 1, 15), status: GameStatus.dead),
    Game('1', ancient: Ancient("Йиг", 0), date: DateTime(2021, 12, 18), status: GameStatus.win),
  ];

  void addGame(Game newGame) {
    _games.add(newGame);
    notifyListeners();
  }

  List<Game> get games {
    _games.sort((a, b) => -a.date.compareTo(b.date));
    return [..._games];
  }
}
