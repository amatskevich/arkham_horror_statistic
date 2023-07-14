import 'package:arkham_horror_statistic/models/static_data.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';

import '../../models/new_game_data.dart';
import '../../providers/game_data_provider.dart';

class InvestigatorInput extends StatefulWidget {
  const InvestigatorInput({Key? key}) : super(key: key);

  @override
  State<InvestigatorInput> createState() => _InvestigatorInputState();
}

class _InvestigatorInputState extends State<InvestigatorInput> {
  @override
  Widget build(BuildContext context) {
    var investigators = Provider.of<GameDataProvider>(context, listen: false)
        .getInvestigators()
        .map((e) => MultiSelectItem(e, e.name))
        .toList();
    final newDataProvider = Provider.of<NewGameData>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: MultiSelectDialogField<Investigator>(
        title: const Text('Сыщики'),
        items: investigators,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
        ),
        buttonText: Text(
          'Сыщики',
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 16,
          ),
        ),
        listType: MultiSelectListType.LIST,
        onConfirm: (values) {
          newDataProvider.addInvestigators(values);
        },
      ),
    );
  }
}
