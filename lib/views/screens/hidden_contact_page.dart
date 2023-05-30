import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_contact_diary_app/controllers/list_controller.dart';

class HiddenContactsPage extends StatelessWidget {
  const HiddenContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hidden Contacts"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: Provider.of<ListController>(context).getAllHiddenContacts.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(Provider.of<ListController>(context).allHiddenContacts[index].name),
            subtitle: Text(Provider.of<ListController>(context).allHiddenContacts[index].number),
          ),
        ),
      ),
    );
  }
}
