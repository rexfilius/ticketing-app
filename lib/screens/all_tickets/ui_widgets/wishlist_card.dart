import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/all_tickets/notifier/all_tickets_notifier.dart';

class WishlistCard extends ConsumerStatefulWidget {
  const WishlistCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishlistCardState();
}

class _WishlistCardState extends ConsumerState<WishlistCard> {
  @override
  Widget build(BuildContext context) {
    final ticket = ref.watch(inMemoryTicketProvider);
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ticket.artist,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text(
                "${ticket.ticketPrice}",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Ref No: ${ticket.ticketRef}"),
              Text("Location: ${ticket.location}"),
            ],
          ),
          SizedBox(height: 12),
          Align(alignment: Alignment.centerLeft, child: Text('Quantity')),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        ticket.quantity += 1;
                      });
                    },
                    icon: Icon(Icons.add),
                  ),
                  Text("${ticket.quantity}"),
                  IconButton(
                    onPressed: () {
                      if (ticket.quantity == 1) {
                        return;
                      } else {
                        setState(() {
                          ticket.quantity -= 1;
                        });
                      }
                    },
                    icon: Icon(Icons.remove),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
