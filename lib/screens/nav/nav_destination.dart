import 'package:flutter/material.dart';

class NavDestination {
  final String label;
  final IconData icon;

  const NavDestination({required this.label, required this.icon});
}

final navDestinations = [
  NavDestination(label: 'Wishlist', icon: Icons.note),
  NavDestination(label: 'All Tickets', icon: Icons.arrow_upward),
  NavDestination(label: 'Account', icon: Icons.person),
];
