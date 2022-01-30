import 'package:flutter/material.dart';

class NewGameScreen extends StatelessWidget {
  static const routeName = '/new_game';

  const NewGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('New Game Screen'),
    );
  }
}
