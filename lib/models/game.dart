import 'game_status.dart';

class Game {
  String uuid;
  DateTime date;
  int? duration;
  String ancient;
  List<String>? extensions;
  List<String>? heralds;
  List<String>? investigators;
  GameStatus status;
  String? scoring;
  String? description;

  Game(
    this.uuid, {
    required this.date,
    this.duration,
    required this.ancient,
    this.extensions,
    this.heralds,
    this.investigators,
    this.status = GameStatus.inProgress,
    this.scoring,
    this.description,
  });
}
