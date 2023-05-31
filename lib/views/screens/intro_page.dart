import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_contact_diary_app/controllers/intro_provider.dart';
import 'package:provider_contact_diary_app/utils/route_utils.dart';
import 'package:slide_to_act/slide_to_act.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Provider.of<IntroProvider>(context, listen: false).firstDone();
      Navigator.of(context).pushReplacementNamed(MyRoutes.home);
      timer.cancel();
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const FlutterLogo(
              size: 240,
            ),
            const Text("Made with Provider in Flutter"),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                child: SlideAction(
                  onSubmit: () {
                    Navigator.of(context).pushReplacementNamed(MyRoutes.home);
                  },
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
