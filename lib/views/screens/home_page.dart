import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_contact_diary_app/controllers/theme_controller.dart';
import 'package:provider_contact_diary_app/utils/route_utils.dart';
import 'package:provider_contact_diary_app/views/components/my_back_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: Icon(Icons.dark_mode),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(MyRoutes.addContactPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
