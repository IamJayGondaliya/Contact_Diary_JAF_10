import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_contact_diary_app/controllers/counter_controller.dart';
import 'package:provider_contact_diary_app/controllers/intro_provider.dart';
import 'package:provider_contact_diary_app/controllers/stepper_controller.dart';
import 'package:provider_contact_diary_app/controllers/theme_controller.dart';
import 'package:provider_contact_diary_app/utils/route_utils.dart';
import 'package:provider_contact_diary_app/views/screens/add_contact_page.dart';
import 'package:provider_contact_diary_app/views/screens/counter_page.dart';
import 'package:provider_contact_diary_app/views/screens/home_page.dart';
import 'package:provider_contact_diary_app/views/screens/intro_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        //When we've to use value directly which doesn't affects another widget.
        Provider(
          create: (context) => CounterController(),
        ),
        //When we've to pass value in another widget and make changes in that.
        ListenableProvider(
          create: (context) => IntroProvider(),
        ),
        ListenableProvider(
          create: (context) => ThemeProvider(),
        ),
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
      themeMode: Provider.of<ThemeProvider>(context).isDark ? ThemeMode.dark : ThemeMode.light,
      //Light Mode
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      // Dark Mode
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      // initialRoute: Provider.of<IntroProvider>(context).checkFirstTime() ? MyRoutes.introScreen : MyRoutes.home,
      initialRoute: MyRoutes.introScreen,
      routes: {
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.addContactPage: (context) => AddContactPage(),
        MyRoutes.introScreen: (context) => IntroPage(),
      },
    );
  }
}
