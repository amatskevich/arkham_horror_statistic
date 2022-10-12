import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../providers/game_data_provider.dart';

class HeraldInput extends StatefulWidget {
  const HeraldInput({Key? key}) : super(key: key);

  @override
  State<HeraldInput> createState() => _HeraldInputState();
}

class _HeraldInputState extends State<HeraldInput> {
  @override
  Widget build(BuildContext context) {
    var heralds = Provider.of<GameDataProvider>(context, listen: false)
        .heralds
        .map(
          (e) => FormBuilderFieldOption(
            value: e,
            child: Text(e.name),
          ),
        )
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FormBuilderCheckboxGroup(
        name: 'heralds',
        decoration: const InputDecoration(
          labelText: 'Вестники',
        ),
        // options: [],
        options: heralds,
      ),
    );
  }
}
