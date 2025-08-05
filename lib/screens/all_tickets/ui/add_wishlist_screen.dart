import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/all_tickets/notifier/all_tickets_notifier.dart';
import 'package:ticketing_app/screens/all_tickets/ui_widgets/location_dropdown.dart';
import 'package:ticketing_app/screens/all_tickets/ui_widgets/tickets_dropdown.dart';
import 'package:ticketing_app/screens/all_tickets/ui_widgets/wishlist_card.dart';
import 'package:ticketing_app/screens/wishlist/notifier/wishlist_notifier.dart';
import 'package:ticketing_app/utils/custom_app_bar.dart';

class AddWishlistScreen extends ConsumerStatefulWidget {
  const AddWishlistScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddWishlistScreenState();
}

class _AddWishlistScreenState extends ConsumerState<AddWishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final ticket = ref.watch(inMemoryTicketProvider);
    //
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Tickets to Wishlist',
        subtitle: 'Withdraw items seamlessly',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location'),
            LocationDropdown(),
            SizedBox(height: 12),
            Text('Item'),
            TicketsDropdown(),
            SizedBox(height: 12),
            Text(
              'Selected Tickets',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            WishlistCard(),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Color(0xff00AD57),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(),
          ),
          onPressed: () {
            ref.read(wishlistProvider.notifier).addToWishlist(context, ticket);
          },
          child: Text(
            'Add to Wishlist',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
