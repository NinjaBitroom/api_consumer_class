import 'package:api_consumer_class/views/home_page.dart';
import 'package:flutter/material.dart';

class ApiConsumerApp extends StatelessWidget {
  const ApiConsumerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Consumer Class',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
