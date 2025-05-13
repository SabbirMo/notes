import 'package:go_router/go_router.dart';
import 'package:notes/src/features/auth/add_note/add_note.dart';
import 'package:notes/src/features/auth/home/presentation/pages/home_page.dart';
import 'package:notes/src/features/auth/login/presentation/pages/login_page.dart';
import 'package:notes/src/features/auth/registration/presentation/pages/registration_page.dart';
import 'package:notes/src/features/auth/splash/splash_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(path: '/registration_page', builder: (context, state) => const RegistrationPage()),
      GoRoute(path: '/login_page', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/home_page', builder: (context, state) => const HomePage()),
      GoRoute(path: '/add_note', builder: (context, state) => const AddNote()),
    ],
  );
}