import 'package:go_router/go_router.dart';
import 'package:ticketing_app/routes/routes.dart';
import 'package:ticketing_app/screens/all_tickets/ui/add_wishlist_screen.dart';

List<RouteBase> wishlistRoutes = [];

List<RouteBase> allTicketsRoutes = [
  GoRoute(
    path: Routes.addWishlist,
    builder: (context, state) => const AddWishlistScreen(),
  ),
];

List<RouteBase> accountRoutes = [];
