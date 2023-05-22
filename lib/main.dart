import 'package:flutter/material.dart';
import 'package:bmi_calculator/Screen/inPutPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              iconTheme: const IconThemeData(color: Colors.white),
              appBarTheme: const AppBarTheme(backgroundColor: Colors.grey),
              scaffoldBackgroundColor: Colors.white,
              colorScheme: const ColorScheme.light().copyWith(
                brightness: Brightness.light,
                primaryContainer: Colors.grey.shade300,
                surface: Colors.grey.shade400,
                onSurface: Colors.white,
              ),
            ),
            darkTheme: ThemeData.dark().copyWith(
                useMaterial3: true,
                appBarTheme:
                    const AppBarTheme(backgroundColor: Color(0XFF0A0E21)),
                scaffoldBackgroundColor: const Color(0XFF0A0E21),
                colorScheme: const ColorScheme.dark().copyWith(
                  brightness: Brightness.dark,
                  surface: const Color(0xFF4C4F5E),
                  primaryContainer: const Color(0xFF1D1E33),
                )),
            themeMode: currentMode,
            initialRoute: '/',
            routes: {
              '/': (context) => const InputPage(title: 'BMI Calculator'),
            },
          );
        });
  }
}
