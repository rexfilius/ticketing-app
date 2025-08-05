import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/all_tickets/ui_widgets/location_dropdown.dart';

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
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: selectedItem,
      icon: Icon(Icons.expand_more),
      onChanged: (String? item) {
        setState(() {
          selectedItem = item!;
        });
      },
      items: _ticketsItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        focusColor: Colors.black,
        border: dropdownInputBorder,
      ),
    );
  }
}
