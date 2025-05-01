import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnection {
  static var supabase = Supabase.instance.client;

  static upLoadImage(path, filepath) async {
    final file = File(filepath);
    await supabase.storage.from('se7ety').upload(path, file);
  }

  static Future<String> getImage(path) async {
    String image = supabase.storage.from('se7ety').getPublicUrl(path);
    return image;
  }
}
