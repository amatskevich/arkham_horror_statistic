import 'package:arkham_horror_statistic/models/new_game_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../models/static_data.dart';
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
        .getHeralds()
        .map((e) => MultiSelectItem(e, e.name))
        .toList();
    final newDataProvider = Provider.of<NewGameData>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: MultiSelectDialogField<Herald>(
        title: const Text('Вестники'),
        items: heralds,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
        ),
        buttonText: Text(
          'Вестники',
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 16,
          ),
        ),
        listType: MultiSelectListType.CHIP,
        onConfirm: (values) {
          newDataProvider.addHeralds(values);
        },
      ),
    );
  }
}
