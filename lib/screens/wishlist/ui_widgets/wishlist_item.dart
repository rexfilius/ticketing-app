import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/wishlist/model/ticket_wish.dart';
import 'package:ticketing_app/screens/wishlist/ui_widgets/purchase_success_dialog.dart';
import 'package:ticketing_app/screens/wishlist/ui_widgets/purchase_ticket_dialog.dart';

class WishlistItem extends ConsumerStatefulWidget {
  const WishlistItem({super.key, required this.ticket});

  final TicketWish ticket;

  @override
  ConsumerState<WishlistItem> createState() => _WishlistItemState();
}

class _WishlistItemState extends ConsumerState<WishlistItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 221, 212, 212),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.ticket.duration),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.ticket.artist,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                  Text("Amount: ${widget.ticket.ticketPrice}"),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on),
                  Text(widget.ticket.location),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: widget.ticket.purchased
                      ? Colors.grey.shade300
                      : Colors.white,
                  foregroundColor: Colors.black,
                ),
                onPressed: widget.ticket.purchased
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => PurchaseTicketDialog(
                            ticket: widget.ticket,
                            onClickYes: () {
                              setState(() {
                                widget.ticket.purchased = true;
                              });
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                isDismissible: false,
                                isScrollControlled: true,
                                builder: (context) {
                                  return PurchaseSuccessDialog(
                                    ticket: widget.ticket,
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                child: Text(
                  widget.ticket.purchased ? 'View Receipt' : 'Purchase Ticket',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
