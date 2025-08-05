import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/all_tickets/models/ticket_model.dart';
import 'package:ticketing_app/screens/wishlist/model/wishlist_state.dart';
import 'package:flutter/material.dart';

final wishlistProvider = NotifierProvider<WishlistNotifier, WishlistState>(
  WishlistNotifier.new,
);

class WishlistNotifier extends Notifier<WishlistState> {
  @override
  WishlistState build() {
    return WishlistState(list: []);
  }

  void addToWishlist(BuildContext context, TicketModel ticket) {
    final isDuplicate = state.list.any((t) => t.ticketRef == ticket.ticketRef);

    if (isDuplicate) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Already added')));
      return;
    }

    state = state.copyWith(list: [...state.list, ticket]);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Added to wish list')));
  }
}
