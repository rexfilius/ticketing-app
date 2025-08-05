import 'package:equatable/equatable.dart';
import 'package:ticketing_app/screens/all_tickets/models/ticket_model.dart';
import 'package:ticketing_app/screens/wishlist/model/ticket_wish.dart';

class WishlistState extends Equatable {
  final List<TicketModel> modelList;
  final List<TicketWish> wishlist;
  final List<TicketWish> purchasedTickets;

  const WishlistState({
    required this.modelList,
    required this.wishlist,
    required this.purchasedTickets,
  });

  WishlistState copyWith({
    List<TicketModel>? modelList,
    List<TicketWish>? wishlist,
    List<TicketWish>? purchasedTickets,
  }) {
    return WishlistState(
      modelList: modelList ?? this.modelList,
      wishlist: wishlist ?? this.wishlist,
      purchasedTickets: purchasedTickets ?? this.purchasedTickets,
    );
  }

  @override
  List<Object?> get props => [modelList, wishlist, purchasedTickets];
}
