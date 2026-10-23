import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (c,s) => Scaffold(body: Center(child: Text('Quantum Feed')))),
      GoRoute(path: '/create', builder: (c,s) => Scaffold(body: Center(child: Text('Create')))),
      GoRoute(path: '/profile', builder: (c,s) => Scaffold(body: Center(child: Text('Profile')))),
    ],
  );
});
