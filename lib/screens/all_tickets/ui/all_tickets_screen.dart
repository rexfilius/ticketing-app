import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/data/fetch_tickets_api.dart';
import 'package:ticketing_app/screens/all_tickets/ui_widgets/location_dropdown.dart';
import 'package:ticketing_app/screens/all_tickets/ui_widgets/tickets_dropdown.dart';
import 'package:ticketing_app/screens/all_tickets/ui_widgets/tickets_list_view.dart';
import 'package:ticketing_app/utils/custom_app_bar.dart';

class AllTicketsScreen extends ConsumerStatefulWidget {
  const AllTicketsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllTicketsScreenState();
}

class _AllTicketsScreenState extends ConsumerState<AllTicketsScreen> {
  @override
  void initState() {
    super.initState();
    //fetchTicketList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'List of Tickets',
        subtitle: 'Select the tickets you wish to pay for',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location'),
            LocationDropdown(),
            SizedBox(height: 12),
            Text('Tickets'),
            TicketsDropdown(),
            Expanded(child: TicketsListView()),
          ],
        ),
      ),
    );
  }
}
