import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';
import 'package:provider/provider.dart';

import '../models/new_game_data.dart';

class GameDateInput extends StatefulWidget {
  const GameDateInput({Key? key}) : super(key: key);

  @override
  State<GameDateInput> createState() => _GameDateInputState();
}

class _GameDateInputState extends State<GameDateInput> {
  final format = DateFormat("yyyy-MM-dd");
  DateTime? _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final newDataProvider = Provider.of<NewGameData>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: DateTimeField(
        dateFormat: format,
        dateTextStyle: TextStyle(color: Colors.blue.shade700),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.blue.shade700),
          errorStyle: const TextStyle(color: Colors.redAccent),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
          ),
          suffixIcon: const Icon(Icons.event_note),
          labelText: 'Дата игры',
          filled: true,
          fillColor: Colors.lightBlue[50],
          floatingLabelStyle: TextStyle(color: Colors.blue.shade700),
        ),
        mode: DateTimeFieldPickerMode.date,
        onDateSelected: (DateTime value) {
          setState(() {
            _selectedDate = value;
            newDataProvider.updateDate(value);
          });
        },
        selectedDate: _selectedDate,
      ),
    );
  }
}
