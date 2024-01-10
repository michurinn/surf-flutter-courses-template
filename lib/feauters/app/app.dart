import 'package:flutter/material.dart';
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
    return const MaterialApp(
      home: PetRegistrationSrceen(),
    );
  }
}
