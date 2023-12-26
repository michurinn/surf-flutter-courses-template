import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/data/repository/profile_pictures_repository/profile_picture_repository_current.dart';
import 'package:surf_flutter_courses_template/interactors/profile_picture_interactor.dart';
import 'package:surf_flutter_courses_template/screen/profile_pictures_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: Provider(
        create: (context) => ProfilePicturesInteractor(
          ProfilePictureRepository(),
        ),
        child: const ProfilePicturesScreen(),
      ),
    );
  }
}
