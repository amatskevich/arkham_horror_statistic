import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ScoreInput extends StatefulWidget {
  const ScoreInput({Key? key}) : super(key: key);

  @override
  State<ScoreInput> createState() => _ScoreInputState();
}

class _ScoreInputState extends State<ScoreInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FormBuilderTextField(
        name: 'score',
        decoration: const InputDecoration(
          labelText: 'Победные очки',
        ),
        keyboardType: TextInputType.number,
        validator: FormBuilderValidators.numeric(),
      ),
    );
  }
}
