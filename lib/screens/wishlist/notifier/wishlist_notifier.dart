import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/all_tickets/models/ticket_model.dart';
import 'package:ticketing_app/screens/wishlist/model/ticket_wish.dart';
import 'package:ticketing_app/screens/wishlist/model/wishlist_state.dart';
import 'package:flutter/material.dart';

final wishlistProvider = NotifierProvider<WishlistNotifier, WishlistState>(
  WishlistNotifier.new,
);

class WishlistNotifier extends Notifier<WishlistState> {
  @override
  WishlistState build() {
    return WishlistState(modelList: [], wishlist: [], purchasedTickets: []);
  }

  void addToWishlist(BuildContext context, TicketModel ticket) {
    final isDuplicate = state.modelList.any(
      (t) => t.ticketRef == ticket.ticketRef,
    );

    if (isDuplicate) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Already added')));
      return;
    }

    final ticketWishlist = modelDtoToWishDto(ticket);
    state = state.copyWith(
      modelList: [...state.modelList, ticket],
      wishlist: [...state.wishlist, ticketWishlist],
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Added to wish list')));
  }

  void addToPurchasedList(BuildContext context, TicketWish ticket) {
    final isDuplicate = state.purchasedTickets.any(
      (t) => t.ticketRef == ticket.ticketRef,
    );
    if (isDuplicate) {
      return;
    }
    state = state.copyWith(
      purchasedTickets: [...state.purchasedTickets, ticket],
    );
    debugPrint('ADDED TO PURCHASED TICKETS');
  }
}
