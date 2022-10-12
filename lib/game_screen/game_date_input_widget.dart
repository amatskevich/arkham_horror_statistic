import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class GameDateInput extends StatefulWidget {
  const GameDateInput({Key? key}) : super(key: key);

  @override
  State<GameDateInput> createState() => _GameDateInputState();
}

class _GameDateInputState extends State<GameDateInput> {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FormBuilderDateTimePicker(
          name: 'game_date',
          format: format,
          inputType: InputType.date,
          decoration: const InputDecoration(labelText: 'Дата игры'),
          initialValue: DateTime.now(),
          validator: (value) => _validateMandatoryFields(value),
          initialDatePickerMode: DatePickerMode.day),
    );
  }

  String? _validateMandatoryFields(value) {
    if (value == null) {
      return "Пожалуста заполните обязательные поля";
    }
    return null;
  }
}
