import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/login_screen.dart';
import '../../features/feed/feed_screen.dart';
import '../../features/create/create_screen.dart';
import '../../features/profile/profile_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (c,s) => const LoginScreen()),
      GoRoute(path: '/feed', builder: (c,s) => const FeedScreen()),
      GoRoute(path: '/create', builder: (c,s) => const CreateScreen()),
      GoRoute(path: '/profile', builder: (c,s) => const ProfileScreen()),
    ],
  );
});
