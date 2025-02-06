import 'package:eco_ideas/l10n/l10n.dart';
import 'package:eco_ideas/routing/go_router.dart';
import 'package:eco_ideas/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      theme: EcoIdeasTheme.light,
      darkTheme: EcoIdeasTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: goRouter,
    );
  }
}
