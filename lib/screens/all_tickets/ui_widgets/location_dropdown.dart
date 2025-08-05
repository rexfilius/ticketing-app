import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<String> _locations = ['Lagos', 'Abuja', 'Port Harcourt', 'Enugu', 'Kano'];

class LocationDropdown extends ConsumerStatefulWidget {
  const LocationDropdown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LocationDropdownState();
}

class _LocationDropdownState extends ConsumerState<LocationDropdown> {
  String? selectedLocation;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: const Text('Select Location'),
      value: selectedLocation,
      isExpanded: true,
      icon: Icon(Icons.expand_more),
      onChanged: (String? item) {
        setState(() {
          selectedLocation = item;
        });
        if (item != null) {
          ref.read(selectedLocationProvider.notifier).state = item;
        }
      },
      items: _locations.map<DropdownMenuItem<String>>((String value) {
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

final selectedLocationProvider = StateProvider<String>((ref) {
  return '';
});

final OutlineInputBorder dropdownInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(color: Color(0xffFFFFFF)),
);
