import 'package:ticketing_app/screens/all_tickets/models/ticket_model.dart';

class TicketWish {
  final String artist;
  final int ticketPrice;
  final String duration;
  final String location;
  final String locationHex;
  final String eventDate;
  final String ticketRef;
  final int qtyAvailable;
  final bool purchased;
  int quantity;

  TicketWish({
    required this.artist,
    required this.ticketPrice,
    required this.duration,
    required this.location,
    required this.locationHex,
    required this.eventDate,
    required this.ticketRef,
    required this.qtyAvailable,
    required this.purchased,
    required this.quantity,
  });
}

TicketWish modelDtoToWishDto(TicketModel model) {
  return TicketWish(
    artist: model.artist,
    ticketPrice: model.ticketPrice,
    duration: model.duration,
    location: model.location,
    locationHex: model.locationHex,
    eventDate: model.eventDate,
    ticketRef: model.ticketRef,
    qtyAvailable: model.qtyAvailable,
    purchased: model.purchased,
    quantity: model.quantity,
  );
}
