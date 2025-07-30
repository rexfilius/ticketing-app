import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/all_tickets/models/all_tickets_state.dart';
import 'package:ticketing_app/screens/all_tickets/models/ticket_model.dart';

final inMemoryTicketProvider = StateProvider((ref) {
  return TicketModel.empty();
});

final allTicketsProvider =
    NotifierProvider<AllTicketsNotifier, AllTicketsState>(
      AllTicketsNotifier.new,
    );

class AllTicketsNotifier extends Notifier<AllTicketsState> {
  @override
  AllTicketsState build() {
    return AllTicketsState();
  }
}
