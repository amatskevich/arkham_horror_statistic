import 'package:arkham_horror_statistic/models/static_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../models/new_game_data.dart';
import '../providers/game_data_provider.dart';

class AncientInput extends StatefulWidget {
  const AncientInput({Key? key}) : super(key: key);

  @override
  State<AncientInput> createState() => _AncientInputState();
}

class _AncientInputState extends State<AncientInput> {
  Ancient? _selectedValue;

  @override
  Widget build(BuildContext context) {
    var ancients = Provider.of<GameDataProvider>(
      context,
      listen: false,
    ).getAncients();
    final newDataProvider = Provider.of<NewGameData>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<Ancient>(
          isExpanded: true,
          hint: Row(
            children: [
              Expanded(
                child: Text(
                  'Выберите древнего',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue.shade700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: ancients
              .map((Ancient item) => DropdownMenuItem<Ancient>(
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
              newDataProvider.updateAncient(value!.id);
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
          // dropdownStyleData: DropdownStyleData(
          //   maxHeight: 200,
          //   width: 200,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(14),
          //     color: Colors.redAccent,
          //   ),
          //   offset: const Offset(-20, 0),
          //   scrollbarTheme: ScrollbarThemeData(
          //     radius: const Radius.circular(40),
          //     thickness: MaterialStateProperty.all(6),
          //     thumbVisibility: MaterialStateProperty.all(true),
          //   ),
          // ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}
