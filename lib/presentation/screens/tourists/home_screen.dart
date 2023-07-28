import 'package:flutter/material.dart';

import 'package:flutter_lu/presentation/views/views.dart';
import 'package:flutter_lu/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';
  final int pageIndex;

  HomeScreen({
    super.key, 
    required this.pageIndex
  });

  final viewRoutes = <Widget>[
    const HomeView(),
    const TouristsView()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation( currentIndex: pageIndex ),
    );
  
  }
}