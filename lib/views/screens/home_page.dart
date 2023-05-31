import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider_contact_diary_app/controllers/theme_controller.dart';
import 'package:provider_contact_diary_app/utils/route_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onLongPress: () async {
              print("Long Pressed.....");
              LocalAuthentication auth = LocalAuthentication();

              bool done = await auth.authenticate(
                localizedReason: "Open to access hidden contacts !!",
              );

              if (done) {
                Navigator.of(context).pushNamed(MyRoutes.hiddenContactPage);
              }
            },
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.dark_mode),
            ),
          ),
          PopupMenuButton(
            offset: const Offset(0, 50),
            onSelected: (val) async {
              if (val == MyRoutes.hiddenContactPage) {
                LocalAuthentication auth = LocalAuthentication();

                bool done = await auth.authenticate(
                  localizedReason: "Open to access hidden contacts !!",
                );

                if (done) {
                  Navigator.of(context).pushNamed(MyRoutes.hiddenContactPage);
                }
              } else {
                Navigator.of(context).pushNamed(val);
              }
            },
            icon: Icon(Icons.list),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: MyRoutes.addContactPage,
                child: const Text("Add Contact Page"),
              ),
              PopupMenuItem(
                value: MyRoutes.hiddenContactPage,
                child: const Text("Hidden Contact Page"),
              ),
            ],
          ),
        ],
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(20),
      //   child: ListView.builder(
      //     itemCount: Provider.of<ListController>(context).getAllContacts.length,
      //     itemBuilder: (context, index) => ListTile(
      //       title: Text(Provider.of<ListController>(context, listen: false).getAllContacts[index].title),
      //       subtitle: Text(Provider.of<ListController>(context, listen: false).getAllContacts[index].subTitle),
      //       trailing: IconButton(
      //         icon: const Icon(Icons.delete),
      //         onPressed: () {
      //           Provider.of<ListController>(context, listen: false).removeItem(index: index);
      //         },
      //       ),
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(MyRoutes.addContactPage);

          // String? title;
          // String? subTitle;
          //
          // showDialog(
          //   context: context,
          //   builder: (context) => AlertDialog(
          //     title: const Text("Add item"),
          //     content: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         TextField(
          //           onChanged: (val) {
          //             title = val;
          //           },
          //         ),
          //         TextField(
          //           onChanged: (val) {
          //             subTitle = val;
          //           },
          //         ),
          //       ],
          //     ),
          //     actions: [
          //       ElevatedButton(
          //         onPressed: () {
          //           Provider.of<ListController>(context, listen: false).addItem(title: title!, subtitle: subTitle!);
          //           Navigator.of(context).pop();
          //         },
          //         child: const Text("Add"),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //           Navigator.of(context).pop();
          //         },
          //         child: const Text("Cancel"),
          //       ),
          //     ],
          //   ),
          // );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
