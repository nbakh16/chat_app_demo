import 'package:chat_app_demo/auth/auth_gate.dart';
import 'package:chat_app_demo/view/home_view.dart';
import 'package:chat_app_demo/view/login_view.dart';
import 'package:chat_app_demo/view/register_view.dart';
import 'package:go_router/go_router.dart';

final appRoutes = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  // redirect: (context, state) {
  //   if (!isLoggedIn) {
  //     return '/login';
  //   }
  //   return null;
  // },
  routes: [
    GoRoute(
      path: '/',
      name: RouteName.auth,
      builder: (context, state) => const AuthGate(),
    ),
    GoRoute(
      path: '/home',
      name: RouteName.home,
      builder: (context, state) => const HomeView(),
      // redirect: (context, state) {
      //   if (!isLoggedIn) {
      //     return '/login';
      //   }
      //   return null;
      // },
    ),
    GoRoute(
      path: '/login',
      name: RouteName.login,
      builder: (context, state) => LoginView(),
      routes: [
        GoRoute(
          path: 'register',
          name: RouteName.register,
          builder: (context, state) => RegisterView(),
        ),
      ],
    ),
    // GoRoute(
    //   path: '/profile/:name',
    //   name: ProfilePage.routeName,
    //   builder: (context, state) {
    //     final String name = state.pathParameters['name']!;
    //     return ProfilePage(name: name);
    //   },
    // ),
  ],
);

class RouteName {
  RouteName._();
  static const String auth = 'auth';
  static const String home = 'home';
  static const String login = 'login';
  static const String register = 'register';
}
