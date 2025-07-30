import 'package:go_router/go_router.dart';
import 'package:ticketing_app/routes/routes.dart';
import 'package:ticketing_app/routes/routes_branches.dart';
import 'package:ticketing_app/screens/account/account_screen.dart';
import 'package:ticketing_app/screens/all_tickets/ui/all_tickets_screen.dart';
import 'package:ticketing_app/screens/nav/nav_screen.dart';
import 'package:ticketing_app/screens/splash/splash_screen.dart';
import 'package:ticketing_app/screens/wishlist/wishlist_screen.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: topRoutes,
);

List<RouteBase> topRoutes = [
  GoRoute(
    path: Routes.splash,
    builder: (context, state) => const SplashScreen(),
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return NavScreen(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.wishlist,
            builder: (context, state) => const WishlistScreen(),
            routes: wishlistRoutes,
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.allTickets,
            builder: (context, state) => const AllTicketsScreen(),
            routes: allTicketsRoutes,
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.account,
            builder: (context, state) => const AccountScreen(),
            routes: accountRoutes,
          ),
        ],
      ),
    ],
  ),
];
