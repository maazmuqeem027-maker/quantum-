import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://YOUR_SUPABASE_URL.supabase.co', 
    anonKey: 'YOUR_SUPABASE_ANON_KEY'
  );
  runApp(const ProviderScope(child: QuantumApp()));
}

class QuantumApp extends ConsumerWidget {
  const QuantumApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      routerConfig: router, 
      title: 'Quantum', 
      theme: AppTheme.lightTheme, 
      debugShowCheckedModeBanner: false
    );
  }
}
