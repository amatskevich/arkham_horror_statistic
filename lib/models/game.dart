import 'package:objectbox/objectbox.dart';

import 'game_status.dart';
import 'static_data.dart';

@Entity()
class Game {
  int id = 0;
  @Property(type: PropertyType.date)
  DateTime date = DateTime.now();
  int? duration;
  final ancient = ToOne<Ancient>();
  final extensions = ToMany<Extension>();
  final heralds = ToMany<Herald>();
  final investigators = ToMany<Investigator>();
  String status = GameStatus.inProgress.name;
  String? scoring;
  String? description;

  @override
  String toString() {
    return 'Game{id: $id, date: $date, duration: $duration, ancient: $ancient, extensions: $extensions, heralds: $heralds, investigators: $investigators, status: $status, scoring: $scoring, description: $description}';
  }
}
