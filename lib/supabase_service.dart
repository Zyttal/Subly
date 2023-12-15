import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService with ChangeNotifier {
  late final SupabaseClient _client;

  SupabaseClient get client => _client;

  Future<void> initializeSupabase() async {
    _client = SupabaseClient('https://jcfxgiuxnlvgtnbyrpex.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjZnhnaXV4bmx2Z3RuYnlycGV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI0OTk0NzYsImV4cCI6MjAxODA3NTQ3Nn0.e_H52df6_Um1eIdXEx4XPV1sccC--yO4AvfbHsy-M2g');
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> fetchSellers() async {
    final future = _client.from('sellers').select<List<Map<String, dynamic>>>();
    return future;
  }

  Future<List<Map<String, dynamic>>> fetchItems() async {
    final future = _client
        .from('items')
        .select<List<Map<String, dynamic>>>('*, seller_id:sellers(store_name)');
    return future;
  }

  Future<bool> insertBuyer(
      {required String email,
      required String fullName,
      required String phoneNumber,
      required String homeAddress,
      required String password}) async {
    try {
      await _client.from('buyers').insert([
        {
          'email_address': email,
          'full_name': fullName,
          'phone_number': phoneNumber,
          'home_address': homeAddress,
          'password': password
        }
      ]);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> signIn({required String email, required String password}) async {
    try {
      await _client
          .from('buyers')
          .select()
          .eq('email_address', email)
          .eq('password', password)
          .single();

      return true;
    } catch (error) {
      return false;
    }
  }

  Future<Map<String, dynamic>?> getBuyer(String email) async {
    try {
      final response = await _client
          .from('buyers')
          .select()
          .eq('email_address', email)
          .single();
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<bool> updateBuyer(
      {required String id,
      required String email,
      required String fullName,
      required String phoneNumber,
      required String homeAddress,
      required String password}) async {
    try {
      await _client.from('buyers').update({
        'email_address': email,
        'full_name': fullName,
        'phone_number': phoneNumber,
        'home_address': homeAddress,
        'password': password,
      }).eq('id', id);

      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> deleteBuyer(String email) async {
    try {
      await _client.from('buyers').delete().eq('email_address', email);
      return true;
    } catch (error) {
      return false;
    }
  }
}
