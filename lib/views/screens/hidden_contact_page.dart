import 'dart:io';

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
        child: Consumer<ListController>(
          builder: (context, provider, child) => ListView.builder(
            itemCount: provider.getAllHiddenContacts.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                foregroundImage: FileImage(
                  File(provider.allHiddenContacts[index].imagePath),
                ),
              ),
              title: Text(provider.allHiddenContacts[index].name),
              subtitle: Text(provider.allHiddenContacts[index].number),
            ),
          ),
        ),
      ),
    );
  }
}
