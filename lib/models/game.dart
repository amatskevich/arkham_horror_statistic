import 'package:arkham_horror_statistic/providers/game_data_provider.dart';

import 'game_status.dart';

class Game {
  String uuid;
  DateTime date;
  int? duration;
  Ancient ancient;
  List<Extension> extensions;
  List<Herald> heralds;
  List<Investigator> investigators;
  GameStatus status;
  String? scoring;
  String? description;

  Game(
    this.uuid, {
    required this.date,
    this.duration,
    required this.ancient,
    this.extensions = const [],
    this.heralds = const [],
    this.investigators = const [],
    this.status = GameStatus.inProgress,
    this.scoring,
    this.description,
  });
}
