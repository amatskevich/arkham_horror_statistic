import 'package:arkham_horror_statistic/main.dart';
import 'package:arkham_horror_statistic/models/game.dart';
import 'package:arkham_horror_statistic/providers/object_box.dart';
import 'package:flutter/material.dart';

import 'game_data_provider.dart';

class GameProvider with ChangeNotifier {

  GameProvider(ObjectBox objectbox);

  void addGame(Game newGame) {
    objectbox.saveGame(newGame);
    notifyListeners();
  }

  List<Game> get games {
    List<Game> _games = objectbox.getAllGames(); //TODO sort on db side
    _games.sort((a, b) => -a.date.compareTo(b.date));
    return _games;
  }
}
