import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_provider.g.dart';

// TODO(fatyga): organize this in some way
// TODO(fatyga): check if implicit auth flow is appropriate
@riverpod
SupabaseClient supabaseClient(Ref ref) => Supabase.instance.client;

@riverpod
GoTrueClient goTrueClient(Ref ref) => ref.read(supabaseClientProvider).auth;
