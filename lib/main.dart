import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart'
    as path_provider;
import 'package:dinner_generator_app/features/data/models/meal_model.dart';
import 'package:dinner_generator_app/features/data/models/drink_model.dart';
import 'features/presentations/pages/categories.dart';
import 'injection_container.dart' as di;

Box? mealBox;
Box? drinkBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final appDocumentDirectory = await path_provider
      .getApplicationDocumentsDirectory();

  await Hive.initFlutter(
      appDocumentDirectory.path);

  // Register Adapters
  Hive.registerAdapter(MealModelAdapter());
  Hive.registerAdapter(DrinkModelAdapter());
  // Open Boxes

  await Hive.openLazyBox('meals');
  await Hive.openLazyBox('drinks');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinner Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoryPage(),
    );
  }
}
