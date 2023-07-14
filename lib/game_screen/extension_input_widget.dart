import 'package:arkham_horror_statistic/models/static_data.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../models/new_game_data.dart';
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
        .map((e) => MultiSelectItem(e, e.name))
        .toList();
    final newDataProvider = Provider.of<NewGameData>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: MultiSelectDialogField<Extension>(
        title: const Text('Дополнения'),
        items: extensions,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
        ),
        buttonText: Text(
          'Дополнения',
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 16,
          ),
        ),
        listType: MultiSelectListType.CHIP,
        onConfirm: (values) {
          newDataProvider.addExtensions(values);
        },
      ),
    );
  }
}
