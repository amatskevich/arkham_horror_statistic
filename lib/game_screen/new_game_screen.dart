import 'package:arkham_horror_statistic/models/game.dart';
import 'package:arkham_horror_statistic/models/game_status.dart';
import 'package:arkham_horror_statistic/providers/game_data_provider.dart';
import 'package:arkham_horror_statistic/providers/game_provider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class NewGameScreen extends StatefulWidget {
  static const routeName = '/new_game';

  const NewGameScreen({Key? key}) : super(key: key);

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  final _form = GlobalKey<FormState>();
  final _descriptionFocusNode = FocusNode();
  final format = DateFormat("yyyy-MM-dd");
  final uuid = const Uuid();

  var _ancient = '';
  var _date = DateTime.now();
  var _status = GameStatus.inProgress;

  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_form.currentState!.validate()) {
      _form.currentState?.save();
      var ancient = Provider.of<GameDataProvider>(context, listen: false).getAncientByName(_ancient);
      var game = Game(uuid.v4(), date: _date, ancient: ancient, status: _status);
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Древний',
                    hintText: 'Выбери свой ужас',
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 25),
                  maxLength: 30,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  validator: (value) => _validateMandatoryFields(value),
                  onSaved: (value) => _ancient = value!,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: DateTimeField(
                  format: format,
                  decoration: const InputDecoration(labelText: 'Дата игры'),
                  initialValue: DateTime.now(),
                  validator: (value) => _validateMandatoryFields(value),
                  onSaved: (value) => _date = value!,
                  onShowPicker: (BuildContext context, DateTime? currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1950),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10.0),
              //   child: TextFormField(
              //     decoration: const InputDecoration(
              //       labelText: 'Дополнительная информация',
              //       labelStyle: const TextStyle(fontSize: 20),
              //       border: const OutlineInputBorder(),
              //     ),
              //     style: const TextStyle(fontSize: 25),
              //     maxLines: 5,
              //     maxLength: 300,
              //     minLines: 1,
              //     initialValue: _shift!.description,
              //     keyboardType: TextInputType.multiline,
              //     focusNode: _descriptionFocusNode,
              //     onSaved: (value) {
              //       _description = value != null ? value : '';
              //     },
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      'Отмена',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _saveForm,
                    child: const Text(
                      'Сохранить',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightGreen),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
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

  String? _validateMandatoryFields(value) {
    if (value == null) {
      return "Пожалуста заполните обязательные поля";
    }
    return null;
  }
}
