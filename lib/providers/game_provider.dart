import 'package:arkham_horror_statistic/models/game.dart';
import 'package:arkham_horror_statistic/models/game_status.dart';
import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  final List<Game> _games = [
    Game(3, ancient: "Ktulhu", date: DateTime.now()),
    Game(2, ancient: "Azatot", date: DateTime(2022, 1, 15), status: GameStatus.dead),
    Game(1, ancient: "Yig", date: DateTime(2021, 12, 18), status: GameStatus.win),
  ];

  void addGame(Game newGame) {
    _games.add(newGame);
    notifyListeners();
  }

  List<Game> get games => [..._games];
}
