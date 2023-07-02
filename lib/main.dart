import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:search_image_app/data/repository/photo_api_repository_impl.dart';

import 'data/data_source/pixabay_api.dart';
import 'domain/use_case/get_photos_use_case.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/home/home_view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(GetPhotosUseCase(
            PhotoApiRepositoryImpl(PixabayApi(http.Client())))),
        child: const HomeScreen(),
      ),
    );
  }
}
