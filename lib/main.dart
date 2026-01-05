import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jeevan/theme.dart';
import 'package:jeevan/nav.dart';
import 'package:jeevan/models/app_state.dart';

/// Main entry point for the application
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp.router(
        title: 'JEEVAN',
        debugShowCheckedModeBanner: false,

        // Theme configuration
        theme: appTheme,
        darkTheme: appTheme, // Enforce dark theme
        themeMode: ThemeMode.dark,

        routerConfig: AppRouter.router,
      ),
    );
  }
}
