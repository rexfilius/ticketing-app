import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/all_tickets/models/ticket_model.dart';

final inMemoryTicketModelProvider = StateProvider((ref) {
  return TicketModel.empty();
});
