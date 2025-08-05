# ticketing_app

A new Flutter project.

## Running the app
This project was built with the following versions of Dart and Flutter:
- Dart: 3.8.1
- Flutter: 3.32.6

## App Architecture
Each feature in the app has its own folder in the codebase.
GoRouter is used for navigation.
Riverpod is used for state management.
Dio is used for network calls.

The main screen has a bottom navigation bar that toggles between three screens: Wishlist, All Tickets, and Account.

On the Wishlist screen, the user sees the list of tickets they have added to their wishlist. They can purchase a ticket, and a dialog pops up for confirmation or cancellation. After a purchase, the ticket receipt can be printed (the data is logged to the IDE console).

On the All Tickets screen, the user sees the list of available tickets for the location selected in the Location dropdown. When they select a ticket, they are navigated to another screen where they can choose the quantity and add the ticket to their wishlist.

All data is stored in memory.

## Getting Started with Flutter
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
