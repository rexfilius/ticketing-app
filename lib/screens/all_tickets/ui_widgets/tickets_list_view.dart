import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketing_app/routes/routes.dart';
import 'package:ticketing_app/screens/all_tickets/models/ticket_model.dart';
import 'package:ticketing_app/screens/all_tickets/notifier/all_tickets_notifier.dart';
import 'package:intl/intl.dart';
import 'package:ticketing_app/screens/all_tickets/ui_widgets/location_dropdown.dart';

class TicketsListView extends ConsumerStatefulWidget {
  const TicketsListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TicketsListViewState();
}

class _TicketsListViewState extends ConsumerState<TicketsListView> {
  final TextEditingController _searchController = TextEditingController();

  void _onCheckboxChanged(TicketModel item, bool? checked) {
    setState(() => item.isChecked = checked!);
    if (item.isChecked) {
      ref.read(inMemoryTicketModelProvider.notifier).state = item;
      context.push(RouteNest.addWishlist);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();
    final selectedLocation = ref.watch(selectedLocationProvider);
    final visibleTickets = tickets.where((t) {
      final matchesQuery =
          query.isEmpty ||
          t.artist.toLowerCase().contains(query) ||
          t.ticketRef.toLowerCase().contains(query);
      final matchesLocation = t.location == selectedLocation;
      return matchesQuery && matchesLocation;
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: TextField(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFFF7F6F7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: visibleTickets.length,
            itemBuilder: (context, index) {
              final item = visibleTickets[index];
              return InkWell(
                onTap: () => _onCheckboxChanged(item, !item.isChecked),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        value: item.isChecked,
                        onChanged: (checked) =>
                            _onCheckboxChanged(item, checked),
                        activeColor: const Color(0xFF00994D),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.artist,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Ref No: ${item.ticketRef}',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₦${NumberFormat('#,##0', 'en_NG').format(item.ticketPrice)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Location: ${item.location}',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
