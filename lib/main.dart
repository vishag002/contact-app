// lib/main.dart
import 'package:contact_application/controller/contact_provider.dart';
import 'package:contact_application/controller/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'model/contact.dart';
import 'view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());
  boxContact = await Hive.openBox<Contact>('contactBox');
  runApp(ChangeNotifierProvider(
    create: (context) => ContactProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
