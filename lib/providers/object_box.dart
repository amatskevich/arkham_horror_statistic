import 'package:arkham_horror_statistic/models/game.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../models/static_data.dart';
import '../objectbox.g.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;
  late final gameBox = store.box<Game>();
  late final extensionBox = store.box<Extension>();
  late final ancientBox = store.box<Ancient>();
  late final heraldBox = store.box<Herald>();
  late final investigatorBox = store.box<Investigator>();
  late final dbVersionBox = store.box<DbVersion>();
  late final dbUserBox = store.box<User>();

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
    var versions = dbVersionBox.getAll();
    if (versions.isEmpty) {
      initData();
    }
    if (dbUserBox.contains(1)) {
      dbUserBox.put(User('DummyUser'));
    }
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx-arkham"));
    return ObjectBox._create(store);
  }

  void saveGame(Game newGame) {
    gameBox.put(newGame);
  }

  List<Game> getAllGames() {
    return gameBox.getAll();
  }

  void initData() {
    investigatorBox.removeAll();
    heraldBox.removeAll();
    ancientBox.removeAll();
    extensionBox.removeAll();
    for (var element in staticExtensions) {
      extensionBox.put(element);
    }
    for (var element in staticAncients) {
      ancientBox.put(element);
    }
    for (var element in staticHeralds) {
      heraldBox.put(element);
    }
    for (var element in staticInvestigators) {
      investigatorBox.put(element);
    }
    dbVersionBox.put(DbVersion());
  }
}