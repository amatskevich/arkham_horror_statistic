import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../providers/game_data_provider.dart';

class ExtensionInput extends StatefulWidget {
  const ExtensionInput({Key? key}) : super(key: key);

  @override
  State<ExtensionInput> createState() => _ExtensionInputState();
}

class _ExtensionInputState extends State<ExtensionInput> {
  @override
  Widget build(BuildContext context) {
    var extensions = Provider.of<GameDataProvider>(context, listen: false)
        .getExtensions() //todo find all except base
        .where((element) => element.id != 1)
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
        name: 'extensions',
        decoration: const InputDecoration(
          labelText: 'Дополнения',
        ),
        // options: [],
        options: extensions,
      ),
    );
  }
}
