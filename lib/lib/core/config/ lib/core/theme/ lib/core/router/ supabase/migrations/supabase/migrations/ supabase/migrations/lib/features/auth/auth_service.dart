import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabase = Supabase.instance.client;
  
  Future<void> signUp(String email, String pass, String username) async {
    final res = await _supabase.auth.signUp(email: email, password: pass);
    if (res.user != null) {
      await _supabase.from('profiles').insert({
        'id': res.user!.id,
        'username': username,
        'display_name': username,
      });
    }
  }
  
  Future<void> signIn(String email, String pass) async {
    await _supabase.auth.signInWithPassword(email: email, password: pass);
  }
}
