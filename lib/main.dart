import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_contact_diary_app/controllers/counter_controller.dart';
import 'package:provider_contact_diary_app/controllers/stepper_controller.dart';
import 'package:provider_contact_diary_app/utils/route_utils.dart';
import 'package:provider_contact_diary_app/views/screens/add_contact_page.dart';
import 'package:provider_contact_diary_app/views/screens/counter_page.dart';
import 'package:provider_contact_diary_app/views/screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        //When we've to use value directly which doesn't affects another widget.
        Provider(
          create: (context) => CounterController(),
        ),
        //When we've to pass value in another widget and make changes in that.
        ListenableProvider(
          create: (context) => MyStepperController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Light Mode
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade400,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
      ),
      //Dark Mode
      // darkTheme: ThemeData(
      //   useMaterial3: true,
      //   brightness: Brightness.dark,
      //   textTheme: const TextTheme(
      //     bodyMedium: TextStyle(
      //       fontSize: 21,
      //       color: Colors.teal,
      //       fontWeight: FontWeight.bold,
      //     ),
      //     headlineLarge: TextStyle(
      //       color: Colors.teal,
      //       fontStyle: FontStyle.italic,
      //     ),
      //   ),
      // ),
      routes: {
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.addContactPage: (context) => AddContactPage(),
        'counter': (context) => CounterPage(),
      },
    );
  }
}
