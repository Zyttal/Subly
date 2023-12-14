import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService with ChangeNotifier {
  late final SupabaseClient _client;

  SupabaseClient get client => _client;

  Future<void> initializeSupabase() async {
    _client = SupabaseClient('https://jcfxgiuxnlvgtnbyrpex.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjZnhnaXV4bmx2Z3RuYnlycGV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI0OTk0NzYsImV4cCI6MjAxODA3NTQ3Nn0.e_H52df6_Um1eIdXEx4XPV1sccC--yO4AvfbHsy-M2g');
    // Any additional initialization if needed
    notifyListeners();
  }
}
