import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env');

    final supabaseUrl = dotenv.env['SUPABASE_URL'];
    final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

    if (supabaseUrl == null ||
        supabaseUrl.isEmpty ||
        supabaseAnonKey == null ||
        supabaseAnonKey.isEmpty) {
      throw Exception(
        'Supabase configuration is missing from .env',
      );
    }

    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );

    runApp(const ProviderScope(child: QuantumApp()));
  } catch (error, stackTrace) {
    debugPrint('Quantum initialization failed: $error');
    debugPrintStack(stackTrace: stackTrace);

    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'Quantum could not start.\n'
                'Check the .env configuration and Supabase settings.\n\n'
                '$error',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
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
      debugShowCheckedModeBanner: false,
    );
  }
}
