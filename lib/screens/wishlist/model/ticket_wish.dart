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
  bool purchased;
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

  TicketWish.empty()
    : artist = '',
      ticketPrice = 0,
      duration = '',
      location = '',
      locationHex = '',
      eventDate = '',
      ticketRef = '',
      qtyAvailable = 0,
      purchased = false,
      quantity = 0;

  @override
  String toString() => {
    "Object": "TicketWish",
    "artist": artist,
    "ticketPrice": ticketPrice,
    "duration": duration,
    "location": location,
    "locationHex": locationHex,
    "eventDate": eventDate,
    "ticketRef": ticketRef,
    "qtyAvailable": qtyAvailable,
    "purchased": purchased,
    "quantity": quantity,
  }.toString();
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
