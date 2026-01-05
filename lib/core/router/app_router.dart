import 'package:enterprise/core/constants/routes_constants.dart';
import 'package:enterprise/features/splash/presentation/splash_page.dart';
import 'package:go_router/go_router.dart';

var router = GoRouter(
  initialLocation: AppRoutes.initial,
  routes: [
    GoRoute(path: AppRoutes.initial, builder: (context, state) => SplashPage()),
  ],
);
