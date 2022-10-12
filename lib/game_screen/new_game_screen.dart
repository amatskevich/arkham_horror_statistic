import 'package:arkham_horror_statistic/models/game.dart';
import 'package:arkham_horror_statistic/models/game_status.dart';
import 'package:arkham_horror_statistic/providers/game_data_provider.dart';
import 'package:arkham_horror_statistic/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
  final _formKey = GlobalKey<FormBuilderState>();
  final _descriptionFocusNode = FocusNode();
  final format = DateFormat("yyyy-MM-dd");
  final uuid = const Uuid();

  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      final formData = _formKey.currentState!.value;
      var ancient = Provider.of<GameDataProvider>(
        context,
        listen: false,
      ).getAncientByName(formData['ancient']);
      var game = Game(
        uuid.v4(),
        date: formData['game_date'],
        ancient: ancient,
        heralds: formData['heralds'],
        investigators: formData['investigators'],
        status: formData['status'],
        scoring: formData['score'],
        description: formData['description'],
        extensions: formData['extensions'],
      );
      debugPrint(game.toString()); // TODO
      Provider.of<GameProvider>(context, listen: false).addGame(game);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var ancients = Provider.of<GameDataProvider>(
      context,
      listen: false,
    ).ancients;
    var heralds = Provider.of<GameDataProvider>(context, listen: false)
        .heralds
        .map(
          (e) => FormBuilderFieldOption(
            value: e,
            child: Text(e.name),
          ),
        )
        .toList();
    var investigators = Provider.of<GameDataProvider>(context, listen: false)
        .investigators
        .map(
          (e) => FormBuilderFieldOption(
            value: e,
            child: Text(e.name),
          ),
        )
        .toList();
    var extensions = Provider.of<GameDataProvider>(context, listen: false)
        .extensions
        .where((element) => element.id != 0)
        .map(
          (e) => FormBuilderFieldOption(
            value: e,
            child: Text(e.name),
          ),
        )
        .toList();
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: FormBuilderDropdown(
                  name: 'ancient',
                  decoration: const InputDecoration(
                    labelText: 'Древний',
                  ),
                  allowClear: false,
                  hint: const Text('Выберите древнего'),
                  items: ancients
                      .map((an) => DropdownMenuItem(
                            value: an.name,
                            child: Text(an.name),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: FormBuilderDropdown(
                  name: 'status',
                  decoration: const InputDecoration(
                    labelText: 'Статус',
                  ),
                  allowClear: false,
                  items: GameStatus.values
                      .map((an) => DropdownMenuItem(
                            value: an,
                            child: Text(an.name),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: FormBuilderCheckboxGroup(
                  name: 'heralds',
                  decoration: const InputDecoration(
                    labelText: 'Вестники',
                  ),
                  // options: [],
                  options: heralds,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: FormBuilderCheckboxGroup(
                  name: 'investigators',
                  decoration: const InputDecoration(
                    labelText: 'Сыщики',
                  ),
                  // options: [],
                  options: investigators,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: FormBuilderDateTimePicker(
                    name: 'game_date',
                    format: format,
                    inputType: InputType.date,
                    decoration: const InputDecoration(labelText: 'Дата игры'),
                    initialValue: DateTime.now(),
                    validator: (value) => _validateMandatoryFields(value),
                    initialDatePickerMode: DatePickerMode.day),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: FormBuilderTextField(
                  name: 'duration',
                  decoration: const InputDecoration(
                    labelText: 'Время игры',
                  ),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.numeric(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: FormBuilderTextField(
                  name: 'score',
                  decoration: const InputDecoration(
                    labelText: 'Победные очки',
                  ),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.numeric(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: FormBuilderCheckboxGroup(
                  name: 'extensions',
                  decoration: const InputDecoration(
                    labelText: 'Дополнения',
                  ),
                  // options: [],
                  options: extensions,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: FormBuilderTextField(
                  name: 'description',
                  decoration: const InputDecoration(
                    labelText: 'Дополнительная информация',
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 25),
                  maxLines: 5,
                  maxLength: 300,
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  focusNode: _descriptionFocusNode,
                ),
              ),
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
