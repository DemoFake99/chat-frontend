import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../src/ui/chat/chat_screen.dart';
import 'routes.dart';

final class RouteManager {
  RouteManager._();

  static GoRouter get route => _routes;

  static final _routes = GoRouter(
    routes: [
      GoRoute(
        path: Routes.initial.path,
        builder: (context, state) => const ChatScreen(),
      ),
      GoRoute(
        path: Routes.login.path,
        builder: (context, state) => const Scaffold(),
      ),
      GoRoute(
        path: Routes.chat.path,
        builder: (context, state) => const ChatScreen(),
      ),
    ],
  );
}
