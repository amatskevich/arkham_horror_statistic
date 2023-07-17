import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/game.dart';
import '../models/new_game_data.dart';


class StatusInput extends StatefulWidget {
  const StatusInput({Key? key}) : super(key: key);

  @override
  State<StatusInput> createState() => _StatusInputState();
}

class _StatusInputState extends State<StatusInput> {
  GameStatus? _selectedValue;

  @override
  Widget build(BuildContext context) {
    final newDataProvider = Provider.of<NewGameData>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<GameStatus>(
          isExpanded: true,
          hint: Row(
            children: [
              Expanded(
                child: Text(
                  'Статус',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue.shade700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: GameStatus.values
              .map((GameStatus item) => DropdownMenuItem<GameStatus>(
            value: item,
            child: Text(
              item.name,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          value: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
              newDataProvider.updateStatus(value!);
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            padding: const EdgeInsets.only(left: 5, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: Colors.blue.shade700,
              ),
              color: Colors.lightBlue[50],
            ),
            // elevation: 2,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_downward,
            ),
            iconSize: 25,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}
