import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DurationInput extends StatefulWidget {
  const DurationInput({Key? key}) : super(key: key);

  @override
  State<DurationInput> createState() => _DurationInputState();
}

class _DurationInputState extends State<DurationInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FormBuilderTextField(
        name: 'duration',
        decoration: const InputDecoration(
          labelText: 'Время игры',
        ),
        keyboardType: TextInputType.number,
        validator: FormBuilderValidators.numeric(),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}
