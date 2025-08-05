import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/wishlist/notifier/wishlist_notifier.dart';
import 'package:ticketing_app/screens/wishlist/ui_widgets/horizontal_date_picker.dart';
import 'package:ticketing_app/screens/wishlist/ui_widgets/wishlist_item.dart';
import 'package:ticketing_app/screens/wishlist/ui_widgets/wishlist_search.dart';
import 'package:ticketing_app/utils/custom_app_bar.dart';

class WishlistScreen extends ConsumerStatefulWidget {
  const WishlistScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends ConsumerState<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final wishlistState = ref.watch(wishlistProvider);
    return Scaffold(
      appBar: CustomAppBar(title: 'Tickets', subtitle: 'See all tickets'),
      body: Column(
        children: [
          WishlistSearch(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                "Jan 2024",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ),
            ),
          ),
          SizedBox(
            height: 140,
            child: HorizontalDatePicker(
              startDate: DateTime.now().subtract(const Duration(days: 2)),
              days: 10,
              onDateSelected: (date) => debugPrint('Picked $date'),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Color(0xff056033),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
            onPressed: () {},
            child: Text('07 Jan 2024'),
          ),
          Expanded(
            child: wishlistState.wishlist.isEmpty
                ? Center(
                    child: Text("No ticket has been added to your wishlist"),
                  )
                : ListView.builder(
                    itemCount: wishlistState.wishlist.length,
                    itemBuilder: (context, index) {
                      final item = wishlistState.wishlist[index];
                      return WishlistItem(ticket: item);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
