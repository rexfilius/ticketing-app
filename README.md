# ticketing_app

A new Flutter project.

## Running the app
This project was built with these versions of Dart & Flutter
- Dart: 3.8.1
- Flutter: 3.32.6

## App Architecture
Each feature in the app has its folder in the codebase.
GoRouter is used for navigation.
Riverpod is used for state management.
Dio is used for network calls.

The main screen had a bottom navigation bar that toggles between 3 screens 
- Wishlist, All Tickets, Account

On the Wishlist screen, user sees the list of tickets added to their wishlist.
On the All Tickets screen, user sees the list of available tickets and on checking, they are navigated to a screen where they can select the quantity and
add the ticket to a wishlist.

## Getting Started With Flutter
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
