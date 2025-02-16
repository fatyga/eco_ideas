import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Add cross-flavor configuration here
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://${dotenv.env['SUPABASE_PROJECT_ID']}.supabase.co",
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    authOptions:
        const FlutterAuthClientOptions(authFlowType: AuthFlowType.implicit),
  );

  runApp(ProviderScope(child: await builder()));
}
