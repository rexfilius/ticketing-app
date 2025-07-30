import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketing_app/screens/wishlist/notifier/wishlist_notifier.dart';
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
          SizedBox(height: 50),
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
            child: ListView.builder(
              itemCount: wishlistState.list.length,
              itemBuilder: (context, index) {
                final item = wishlistState.list[index];
                return Text(item.artist);
              },
            ),
          ),
        ],
      ),
    );
  }
}
