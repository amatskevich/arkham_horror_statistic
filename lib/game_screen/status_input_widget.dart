import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../models/game_status.dart';

class StatusInput extends StatefulWidget {
  const StatusInput({Key? key}) : super(key: key);

  @override
  State<StatusInput> createState() => _StatusInputState();
}

class _StatusInputState extends State<StatusInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FormBuilderDropdown(
        name: 'status',
        decoration: const InputDecoration(
          labelText: 'Статус',
        ),
        allowClear: false,
        items: GameStatus.values
            .map(
              (an) => DropdownMenuItem(
                value: an.name,
                child: Text(an.name),
              ),
            )
            .toList(),
      ),
    );
  }
}
