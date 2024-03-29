import 'package:arkham_horror_statistic/models/new_game_data.dart';
import 'package:arkham_horror_statistic/providers/game_data_provider.dart';
import 'package:arkham_horror_statistic/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'game_screen/new_game_screen.dart';
import 'history_screen/history_sreen.dart';
import 'providers/object_box.dart';

late ObjectBox objectbox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: GameProvider(objectbox)),
        ChangeNotifierProvider.value(value: GameDataProvider(objectbox)),
        ChangeNotifierProvider.value(value: NewGameData()),
      ],
      builder: (ctx, _) {
        return MaterialApp(
          // TODO Localization https://docs.flutter.dev/development/accessibility-and-localization/internationalization
          title: 'Журнал Аркхэма',
          initialRoute: '/',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => const HistoryScreen(),
            NewGameScreen.routeName: (_) => const NewGameScreen(),
          },
        );
      },
    );
  }
}
