import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/all_tickets/models/all_tickets_state.dart';

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
