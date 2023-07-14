import 'package:arkham_horror_statistic/game_screen/description_input_widget.dart';
import 'package:arkham_horror_statistic/game_screen/duration_input_widget.dart';
import 'package:arkham_horror_statistic/game_screen/extension_input_widget.dart';
import 'package:arkham_horror_statistic/game_screen/game_date_input_widget.dart';
import 'package:arkham_horror_statistic/game_screen/herald_input_widget.dart';
import 'package:arkham_horror_statistic/game_screen/investigator_widget/investigator_input_widget.dart';
import 'package:arkham_horror_statistic/game_screen/score_input_widget.dart';
import 'package:arkham_horror_statistic/models/game.dart';
import 'package:arkham_horror_statistic/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/new_game_data.dart';
import 'ancient_input_widget.dart';
import 'status_input_widget.dart';

class NewGameScreen extends StatefulWidget {
  static const routeName = '/new_game';

  const NewGameScreen({Key? key}) : super(key: key);

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final uuid = const Uuid();

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final newDataProvider = Provider.of<NewGameData>(context, listen: false);
      _formKey.currentState?.save();

      final formData = _formKey.currentState!.value;
      var game = Game();
      game.date = formData['game_date'];
      game.ancient.targetId = formData['ancient'];
      game.heralds.addAll(newDataProvider.heralds);
      // game.userAssignments.addAll(formData['userAssignments']);
      game.status = formData['status'];
      game.scoring = formData['score'];
      game.description = formData['description'];
      game.extensions.addAll(formData['extensions']);
      game.duration = int.tryParse(formData['duration']);
      debugPrint(game.toString());
      Provider.of<GameProvider>(context, listen: false).addGame(game);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(child: Text('Добавление партии')),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              const AncientInput(),
              const StatusInput(),
              const HeraldInput(),
              const InvestigatorInput(),
              const GameDateInput(),
              const DurationInput(),
              const ScoreInput(),
              const ExtensionInput(),
              const DescriptionInput(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      'Отмена',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _saveForm,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      'Сохранить',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
