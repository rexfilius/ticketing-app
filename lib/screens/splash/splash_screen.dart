// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticketing_app/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextPage();
  }

  void goToNextPage() async {
    await Future.delayed(Duration(milliseconds: 1500));
    context.go(Routes.wishlist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Icon(Icons.note_add_sharp)));
  }
}
