import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_image_app/data/pixabay_api.dart';
import 'package:search_image_app/ui/home_screen.dart';
import 'package:search_image_app/ui/home_view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}
