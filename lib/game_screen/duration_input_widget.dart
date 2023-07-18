import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/new_game_data.dart';

class DurationInput extends StatefulWidget {
  const DurationInput({Key? key}) : super(key: key);

  @override
  State<DurationInput> createState() => _DurationInputState();
}

class _DurationInputState extends State<DurationInput> {
  @override
  Widget build(BuildContext context) {
    final newDataProvider = Provider.of<NewGameData>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Время игры',
          floatingLabelStyle: TextStyle(color: Colors.blue.shade700),
          labelStyle: TextStyle(color: Colors.blue.shade700),
          filled: true,
          fillColor: Colors.lightBlue[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
          ),
        ),
        style: TextStyle(color: Colors.blue.shade700),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onSubmitted: (String value) {
          newDataProvider.updateDuration(int.tryParse(value)!);
        },
      ),
    );
  }
}
