import 'package:arkham_horror_statistic/main.dart';
import 'package:arkham_horror_statistic/providers/object_box.dart';
import 'package:flutter/material.dart';

import '../models/static_data.dart';

class GameDataProvider with ChangeNotifier {

  GameDataProvider(ObjectBox objectbox);

  List<Ancient> getAncients() {
    return objectbox.ancientBox.getAll();
  }

  Ancient getAncientByName(String name) {
    return getAncients().where((element) => element.name == name).first; //TODO query to db
  }

  List<Extension> getExtensions() {
    return objectbox.extensionBox.getAll();
  }

  List<Herald> getHeralds() {
    return objectbox.heraldBox.getAll();
  }

  List<Investigator> getInvestigators() {
    return objectbox.investigatorBox.getAll();
  }

  Investigator getInvestigatorByName(String name) {
    return getInvestigators().where((element) => element.name == name).first; //TODO query to db
  }
}
