import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/feauters/pet_registration/di/interactors/pet_registration_screen_interactor.dart';
import 'package:surf_flutter_courses_template/feauters/pet_registration/screens/pet_registration_screen.dart';

// App Widget
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider(
        create: (context) => PetRegistrationScreenInteractor(),
        child: const PetRegistrationSrceen(),
      ),
    );
  }
}
