import 'package:go_router/go_router.dart';

import 'package:covid_traking/features/home/ui/ui.dart';
import 'package:covid_traking/features/login/ui/ui.dart';
import 'package:covid_traking/features/more_details/ui/ui.dart';
import 'package:covid_traking/features/splash/ui/ui.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/more-details',
      builder: (context, state) => const MoreDetailsScreen(),
    ),
  ],
);
