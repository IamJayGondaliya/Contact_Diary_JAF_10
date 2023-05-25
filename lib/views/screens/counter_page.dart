import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_contact_diary_app/controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Press + to increase counter",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              //Dynamic UI   => listen: true [DEFAULT]
              "${Provider.of<CounterController>(context, listen: true).counter}",
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Static UI   => listen: false
          Provider.of<CounterController>(context, listen: false).increaseCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
