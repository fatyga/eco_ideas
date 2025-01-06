import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_provider.g.dart';

// TODO(fatyga): organize this in some way
@riverpod
SupabaseClient supabaseClient(Ref ref) => SupabaseClient(
      "https://${dotenv.env['SUPABASE_PROJECT_ID']}.supabase.co",
      dotenv.env['SUPABASE_ANON_KEY']!,
    );

@riverpod
GoTrueClient goTrueClient(Ref ref) => ref.read(supabaseClientProvider).auth;
