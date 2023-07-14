import 'package:objectbox/objectbox.dart';

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
  final userAssignments = ToMany<UserAssignment>();
  String status = GameStatus.inProgress.name;
  String? scoring;
  String? description;

  @override
  String toString() {
    return 'Game{id: $id, date: $date, duration: $duration, ancient: $ancient, extensions: $extensions, heralds: $heralds, investigators: $userAssignments, status: $status, scoring: $scoring, description: $description}';
  }
}

@Entity()
class User {
  int id = 0;
  @Unique()
  String name;

  User(this.name);

  @override
  String toString() {
    return 'User{id: $id, name: $name}';
  }
}

@Entity()
class UserAssignment {
  int id = 0;
  final user = ToOne<User>();
  final investigator = ToOne<Investigator>();
  String state = UserAssignmentState.alive.name;

  @override
  String toString() {
    return 'UserAssignment{id: $id, user: ${user.targetId}, investigator: ${investigator.targetId}, state: $state}';
  }
}

enum GameStatus {
  inProgress, win, dead
}

enum UserAssignmentState {
  alive, dead, retired
}
