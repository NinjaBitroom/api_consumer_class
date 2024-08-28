import 'package:api_consumer_class/views/home_page.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class ApiConsumerApp extends StatelessWidget {
  const ApiConsumerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'API Consumer Class',
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: lightDynamic?.primary ?? Colors.deepPurpleAccent,
            brightness: lightDynamic?.brightness ?? Brightness.light,
          ),
        ),
        darkTheme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: darkDynamic?.primary ?? Colors.deepPurpleAccent,
            brightness: darkDynamic?.brightness ?? Brightness.dark,
          ),
        ),
        home: const HomePage(),
      );
    });
  }
}
