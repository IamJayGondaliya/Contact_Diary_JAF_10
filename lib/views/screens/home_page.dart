import 'package:flutter/material.dart';
import 'package:provider_contact_diary_app/utils/route_utils.dart';
import 'package:provider_contact_diary_app/views/components/my_back_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyBackButton(),
        title: const Text("HomePage"),
        centerTitle: true,
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
