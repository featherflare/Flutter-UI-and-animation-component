import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_ui/firebase_options.dart';
import 'package:practice_ui/screen/favoritePlacesApp/providers/user_places.dart';
import 'package:practice_ui/screen/home.dart';
import 'package:practice_ui/screen/mealsApp/providers/favorites_provider.dart';
import 'package:practice_ui/screen/mealsApp/providers/fillter_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteMeals()),
        ChangeNotifierProvider(create: (_) => FiltersNotifier()),
        ChangeNotifierProvider(create: (_) => UsserPlaceNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}
