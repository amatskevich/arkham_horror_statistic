import 'package:arkham_horror_statistic/models/game.dart';
import 'package:arkham_horror_statistic/models/static_data.dart';
import 'package:flutter/cupertino.dart';

class NewGameData extends ChangeNotifier {
  DateTime date = DateTime.now();
  int duration = 0;
  int ancientId = 0;
  List<Extension> extensions = [];
  List<Herald> heralds = [];
  List<Investigator> investigators = [];
  GameStatus status = GameStatus.inProgress;
  String scoring = '';
  String description = '';

  void updateDate(DateTime newDate) {
    date = newDate;
    notifyListeners();
  }

  void updateDuration(int newDuration) {
    duration = newDuration;
    notifyListeners();
  }

  void updateAncient(int newAncientId) {
    ancientId = newAncientId;
    notifyListeners();
  }

  void addExtensions(List<Extension> newExtensions) {
    extensions.addAll(newExtensions);
    notifyListeners();
  }

  void removeExtension(Extension extension) {
    extensions.remove(extension);
    notifyListeners();
  }

  void addHeralds(List<Herald> newHeralds) {
    heralds.addAll(newHeralds);
    notifyListeners();
  }

  void removeHerald(Herald herald) {
    heralds.remove(herald);
    notifyListeners();
  }

  void addInvestigators(List<Investigator> newInvestigators) {
    investigators.addAll(newInvestigators);
    notifyListeners();
  }

  void updateStatus(GameStatus newStatus) {
    status = newStatus;
    notifyListeners();
  }

  void updateScoring(String newScoring) {
    scoring = newScoring;
    notifyListeners();
  }

  void updateDescription(String newDescription) {
    description = newDescription;
    notifyListeners();
  }

  void initNewData() {
    date = DateTime.now();
    duration = 0;
    ancientId = 0;
    extensions = [];
    heralds = [];
    investigators = [];
    status = GameStatus.inProgress;
    scoring = '';
    description = '';
    notifyListeners();
  }
}
