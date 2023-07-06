import 'package:flutter/material.dart';
import 'package:flutter_dictionary_app/config/theme/app_theme.dart';
import 'package:flutter_dictionary_app/presentation/providers/theme_provider.dart';
import 'package:flutter_dictionary_app/presentation/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final AppTheme appTheme = ref.watch( themeNotifierProvider );

    return MaterialApp(
      theme: appTheme.getTheme(),
      home: Homeview(),
    );
  }
}
