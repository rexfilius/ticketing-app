import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<String> _ticketsItems = ['item 1', 'item 2', 'item 3', 'item 4'];

class TicketsDropdown extends ConsumerStatefulWidget {
  const TicketsDropdown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TicketsDropdownState();
}

class _TicketsDropdownState extends ConsumerState<TicketsDropdown> {
  String selectedItem = _ticketsItems.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedItem,
      icon: Icon(Icons.arrow_downward),
      onChanged: (String? item) {
        setState(() {
          selectedItem = item!;
        });
      },
      items: _ticketsItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(),
    );
  }
}
