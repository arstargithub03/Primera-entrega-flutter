import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static const name = 'home-view';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
            child: Text("Welcome"),
          ),
    );
  }
}