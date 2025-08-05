import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/all_tickets/models/ticket_wishlist.dart';
import 'package:ticketing_app/screens/wishlist/ui_widgets/purchase_ticket_dialog.dart';

class WishlistItem extends ConsumerWidget {
  const WishlistItem({super.key, required this.ticket});

  final TicketWish ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 221, 212, 212),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ticket.duration),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ticket.artist,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                  ),
                  Text("Amount: ${ticket.ticketPrice}"),
                ],
              ),
              Icon(Icons.more_vert),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [Icon(Icons.location_on), Text(ticket.location)]),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ticket.purchased
                      ? Colors.grey.shade300
                      : Colors.white,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  if (ticket.purchased) {
                    // TODO: Navigate to receipt screen if desired
                    return;
                  }
                  //_showConfirmDialog(context, ref, ticket);
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => PurchaseTicketDialog(ticket: ticket),
                  );
                },
                child: Text(
                  ticket.purchased ? 'View Receipt' : 'Purchase Ticket',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /*void _showConfirmDialog(
    BuildContext context,
    WidgetRef ref,
    TicketWish ticket,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Are you sure you want to purchase tickets?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.pop(),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        ref
                            .read(wishlistProvider.notifier)
                            .addToPurchasedList(context, ticket);
                        context.pop();
                      },
                      child: const Text('Yes'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }*/
}
