import 'package:flutter/material.dart';
import 'package:ticketing_app/screens/all_tickets/models/ticket_model.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({super.key, required this.ticket});

  final TicketModel ticket;

  @override
  Widget build(BuildContext context) {
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
          Row(children: [Text(ticket.location)]),
        ],
      ),
    );
  }
}
