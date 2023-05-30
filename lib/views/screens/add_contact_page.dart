import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:provider_contact_diary_app/controllers/counter_controller.dart';
import 'package:provider_contact_diary_app/controllers/list_controller.dart';
import 'package:provider_contact_diary_app/controllers/stepper_controller.dart';
import 'package:provider_contact_diary_app/controllers/theme_controller.dart';
import 'package:provider_contact_diary_app/views/components/my_back_button.dart';

class AddContactPage extends StatelessWidget {
  AddContactPage({Key? key}) : super(key: key);

  String? _name;
  String? _number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const MyBackButton(),
        title: const Text("Add Contact"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: const Icon(Icons.dark_mode),
          ),
          IconButton(
            onPressed: () {
              if (Provider.of<MyStepperController>(context, listen: false).isHidden) {
                Provider.of<ListController>(context, listen: false).addHiddenContact(name: _name!, number: _number!);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Contact added"),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<MyStepperController>(
          builder: (context, provider, widget) => Stepper(
            currentStep: provider.currentStep,
            onStepContinue: () {
              provider.stepIncrease();
            },
            onStepCancel: () {
              provider.stepDecrease();
            },
            onStepTapped: (index) {
              provider.stepTapped(index: index);
            },
            steps: <Step>[
              Step(
                title: const Text("Add Image"),
                state: provider.myState(index: 0),
                content: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      foregroundImage: provider.image != null ? FileImage(provider.image!) : null,
                      child: const Text("Add Image"),
                    ),
                    FloatingActionButton.small(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Select the method"),
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  ImagePicker picker = ImagePicker();

                                  XFile? img = await picker.pickImage(source: ImageSource.camera);

                                  if (img != null) {
                                    provider.setImage(img: File(img.path));
                                  }
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Camera"),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text("Gallery"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Icon(Icons.camera),
                    ),
                  ],
                ),
                isActive: provider.isStepActive(index: 0),
              ),
              Step(
                title: const Text("Name"),
                content: TextField(
                  onChanged: (val) {
                    _name = val;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                isActive: provider.isStepActive(index: 1),
                state: provider.myState(index: 1),
              ),
              Step(
                title: const Text("Contact"),
                content: TextField(
                  onChanged: (val) {
                    _number = val;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                isActive: provider.isStepActive(index: 2),
                state: provider.myState(index: 2),
              ),
              Step(
                title: const Text("Email"),
                content: Stack(),
                isActive: provider.isStepActive(index: 3),
                state: provider.myState(index: 3),
              ),
              Step(
                title: const Text("Status"),
                content: CheckboxListTile(
                  title: const Text("Check to make this contact hidden"),
                  value: Provider.of<MyStepperController>(context).isHidden,
                  onChanged: (val) {
                    Provider.of<MyStepperController>(context, listen: false).hide();
                  },
                ),
                isActive: provider.isStepActive(index: 4),
                state: provider.myState(index: 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
