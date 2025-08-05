import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ticketing_app/screens/wishlist/model/ticket_wish.dart';

class PurchaseSuccessDialog extends StatelessWidget {
  const PurchaseSuccessDialog({super.key, required this.ticket});

  final TicketWish ticket;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: Colors.green),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.check, color: Colors.green, size: 48),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Tickets purchased successfully',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    final now = DateFormat(
                      'yyyy-MM-dd HH:mm:ss',
                    ).format(DateTime.now());
                    debugPrint('==== RECEIPT ====');
                    debugPrint('Ticket: ${ticket.artist}');
                    debugPrint('Amount: ${ticket.ticketPrice}');
                    debugPrint('Purchased at: $now');
                    debugPrint('=================');
                    context.pop();
                  },
                  child: const Text('Print receipt'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
