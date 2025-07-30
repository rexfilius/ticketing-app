import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ticketing_app/screens/all_tickets/models/ticket_model.dart';

const urlTickets = 'https://mocki.io/v1/73412f35-6e49-45c2-b507-c4a452d9614b';

Future<List<TicketModel>> fetchTicketList() async {
  final dio = Dio();
  try {
    final response = await dio.get(urlTickets);
    debugPrint("RESPONSE: ${response.data}");
    return List.from(response.data);
  } catch (error, _) {
    debugPrint("ERROR FETCHING TICKETS: $error");
    return [];
  }
}
