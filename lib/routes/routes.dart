abstract class Routes {
  static const splash = '/';
  static const wishlist = '/wishlist';
  static const allTickets = '/allTickets';
  static const account = '/account';

  static const addWishlist = 'addwishlist';
}

abstract class RouteNest {
  static const addWishlist = '/allTickets/addwishlist';
}
