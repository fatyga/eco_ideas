import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_provider.g.dart';

@riverpod
SupabaseClient supabaseClient(SupabaseClientRef ref) =>
    Supabase.instance.client;

@riverpod
SupabaseAuth supabaseAuth(SupabaseAuthRef ref) => SupabaseAuth.instance;
