import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DescriptionInput extends StatefulWidget {
  const DescriptionInput({Key? key}) : super(key: key);

  @override
  State<DescriptionInput> createState() => _DescriptionInputState();
}

class _DescriptionInputState extends State<DescriptionInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FormBuilderTextField(
        name: 'description',
        decoration: const InputDecoration(
          labelText: 'Дополнительная информация',
          labelStyle: TextStyle(fontSize: 20),
          border: OutlineInputBorder(),
        ),
        style: const TextStyle(fontSize: 25),
        maxLines: 5,
        maxLength: 300,
        minLines: 1,
        keyboardType: TextInputType.multiline,
      ),
    );
  }
}
