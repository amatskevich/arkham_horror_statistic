import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

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
        name: 'userAssignments',
        decoration: const InputDecoration(
          labelText: 'Сыщики',
        ),
        options: investigators,
      ),
    );
  }
}
