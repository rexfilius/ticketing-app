class NavDestination {
  final String label;
  final String logoPath;

  const NavDestination({required this.label, required this.logoPath});
}

final navDestinations = [
  NavDestination(label: 'Wishlist', logoPath: 'assets/svg/logo_wishlist.svg'),
  NavDestination(
    label: 'All Tickets',
    logoPath: 'assets/svg/logo_all_tickets.svg',
  ),
  NavDestination(label: 'Account', logoPath: 'assets/svg/logo_account.svg'),
];
