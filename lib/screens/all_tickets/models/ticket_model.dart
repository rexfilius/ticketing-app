import 'package:equatable/equatable.dart';

class TicketModel {
  final String artist;
  final int ticketPrice;
  final String duration;
  final String location;
  final String locationHex;
  final String eventDate;
  final String ticketRef;
  final int qtyAvailable;
  final bool purchased;
  bool isChecked;
  int quantity;

  TicketModel({
    required this.artist,
    required this.ticketPrice,
    required this.duration,
    required this.location,
    required this.locationHex,
    required this.eventDate,
    required this.ticketRef,
    required this.qtyAvailable,
    required this.purchased,
    this.isChecked = false,
    this.quantity = 1,
  });

  TicketModel.empty()
    : artist = '',
      ticketPrice = 0,
      duration = '',
      location = '',
      locationHex = '',
      eventDate = '',
      ticketRef = '',
      qtyAvailable = 0,
      purchased = false,
      isChecked = false,
      quantity = 0;

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      artist: json['artist'],
      ticketPrice: json['ticket_price'],
      duration: json['duration'],
      location: json['location'],
      locationHex: json['location_hex'],
      eventDate: json['event_date'],
      ticketRef: json['ticket_ref'],
      qtyAvailable: json['quantity_available'],
      purchased: json['purchased'],
    );
  }
}

List<TicketModel> tickets = [
  TicketModel(
    artist: "Tiwa Savage",
    ticketPrice: 10500,
    duration: "6:00 PM - 7:30 PM",
    location: "Abuja",
    locationHex: "#8E24AA",
    eventDate: "2025-08-10T18:00:00Z",
    ticketRef: "0023",
    qtyAvailable: 10,
    purchased: false,
  ),
  TicketModel(
    artist: "Olamide",
    ticketPrice: 10500,
    duration: "6:00 PM - 7:30 PM",
    location: "Abuja",
    locationHex: "#8E24AA",
    eventDate: "2025-08-10T18:00:00Z",
    ticketRef: "0023",
    qtyAvailable: 10,
    purchased: false,
  ),
  TicketModel(
    artist: "Burna",
    ticketPrice: 10500,
    duration: "6:00 PM - 7:30 PM",
    location: "Abuja",
    locationHex: "#8E24AA",
    eventDate: "2025-08-10T18:00:00Z",
    ticketRef: "0023",
    qtyAvailable: 10,
    purchased: false,
  ),
  TicketModel(
    artist: "Davido",
    ticketPrice: 10500,
    duration: "6:00 PM - 7:30 PM",
    location: "Abuja",
    locationHex: "#8E24AA",
    eventDate: "2025-08-10T18:00:00Z",
    ticketRef: "0023",
    qtyAvailable: 10,
    purchased: false,
  ),
  TicketModel(
    artist: "Wizkid",
    ticketPrice: 10500,
    duration: "6:00 PM - 7:30 PM",
    location: "Abuja",
    locationHex: "#8E24AA",
    eventDate: "2025-08-10T18:00:00Z",
    ticketRef: "0023",
    qtyAvailable: 10,
    purchased: false,
  ),
];
 

/*
{
"artist": "Tiwa Savage",
"ticket_price": 18000,
"duration": "6:00 PM - 7:30 PM",
"location": "Abuja",
"location_hex": "#8E24AA",
"event_date": "2025-08-10T18:00:00Z",
"ticket_ref": "TS-ABJ-002",
"quantity_available": 50,
"purchased": false
},
*/