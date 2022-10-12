import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../providers/game_data_provider.dart';

class AncientInput extends StatefulWidget {
  const AncientInput({Key? key}) : super(key: key);

  @override
  State<AncientInput> createState() => _AncientInputState();
}

class _AncientInputState extends State<AncientInput> {
  @override
  Widget build(BuildContext context) {
    var ancients = Provider.of<GameDataProvider>(
      context,
      listen: false,
    ).ancients;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FormBuilderDropdown(
        name: 'ancient',
        decoration: const InputDecoration(
          labelText: 'Древний',
        ),
        allowClear: false,
        hint: const Text('Выберите древнего'),
        items: ancients
            .map(
              (an) => DropdownMenuItem(
                value: an,
                child: Text(an.name),
              ),
            )
            .toList(),
      ),
    );
  }
}
