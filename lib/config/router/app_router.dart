import 'package:go_router/go_router.dart';

import 'package:flutter_lu/presentation/views/views.dart';
import 'package:flutter_lu/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',

  routes: [
     GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(pageIndex: pageIndex);
      },
    ),
  
    GoRoute(
      path: '/tourists',
      name: TouristsView.name,
      builder: (context, state) => const TouristsView(),
    ),
    
    GoRoute(
      path: '/tourists/detail/:touristId',
      name: TouristDetailView.name,
      builder: (context, state) {
        final touristId = state.pathParameters['touristId'] ?? '0';
        return TouristDetailView(touristId: int.parse(touristId));
    },
  ) 
  ]
);