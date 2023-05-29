import 'package:go_router/go_router.dart';
import 'package:indonesia_satu_tujuh_test/presentation/pages/home/home_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
