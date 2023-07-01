import 'package:flutter/material.dart';
import 'package:search_image_app/data/pixabay_api.dart';
import 'package:search_image_app/ui/home_screen.dart';
import 'package:search_image_app/ui/home_view_model.dart';

import 'data/photo_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhotoProvider(
        viewModel: HomeViewModel(
          PixabayApi(),
        ),
        child: const HomeScreen(),
      ),
    );
  }
}
