import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/wishlist/model/wishlist_state.dart';

final wishlistProvider = NotifierProvider<WishlistNotifier, WishlistState>(
  WishlistNotifier.new,
);

class WishlistNotifier extends Notifier<WishlistState> {
  @override
  WishlistState build() {
    return WishlistState(list: []);
  }
}
