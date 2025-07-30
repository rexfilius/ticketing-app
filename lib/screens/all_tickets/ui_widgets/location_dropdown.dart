import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<String> _locations = ['Lagos', 'Abuja', 'Port Harcourt', 'Benin'];

class LocationDropdown extends ConsumerStatefulWidget {
  const LocationDropdown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LocationDropdownState();
}

class _LocationDropdownState extends ConsumerState<LocationDropdown> {
  String selectedLocation = _locations.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedLocation,
      isExpanded: true,
      icon: Icon(Icons.arrow_downward),
      onChanged: (String? item) {
        setState(() {
          selectedLocation = item!;
        });
      },
      items: _locations.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(),
    );
  }
}
