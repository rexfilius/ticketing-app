import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketing_app/routes/routes.dart';
import 'package:ticketing_app/screens/all_tickets/models/ticket_model.dart';

class TicketsListView extends ConsumerStatefulWidget {
  const TicketsListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TicketsListViewState();
}

class _TicketsListViewState extends ConsumerState<TicketsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        final item = tickets[index];
        return CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: item.isChecked,
          title: Text(
            item.artist,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text("Ref No: ${item.ticketRef}"),
          onChanged: (checked) {
            setState(() {
              item.isChecked = checked!;
            });
            if (item.isChecked) {
              context.push(RouteNest.addWishlist);
            }
          },
        );
      },
    );
  }
}
