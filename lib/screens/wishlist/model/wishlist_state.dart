import 'package:equatable/equatable.dart';
import 'package:ticketing_app/screens/all_tickets/models/ticket_model.dart';

class WishlistState extends Equatable {
  final List<TicketModel> list;

  const WishlistState({required this.list});

  WishlistState copyWith({List<TicketModel>? list}) {
    return WishlistState(list: list ?? this.list);
  }

  @override
  List<Object?> get props => [];
}
