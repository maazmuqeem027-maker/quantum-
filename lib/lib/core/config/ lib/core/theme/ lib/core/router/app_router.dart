import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/feed/feed_screen.dart';
import 'package:flutter/material.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (c,s) => const FeedScreen()),
      GoRoute(path: '/create', builder: (c,s) => const Scaffold(body: Center(child: Text('Create Screen')))),
      GoRoute(path: '/profile', builder: (c,s) => const Scaffold(body: Center(child: Text('Profile Screen')))),
    ],
  );
});
