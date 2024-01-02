import 'package:flutter/material.dart';
import 'package:image_search_fast_coding/ui/main_screen.dart';
import 'package:image_search_fast_coding/ui/main_view_model.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primaryColor: Colors.white,
        hintColor: Colors.white
      ),
      darkTheme: ThemeData.dark(),
      home: ChangeNotifierProvider(
          create: (_) => MainViewModel(),
          child: const MainScreen()),
    );
  }
}
