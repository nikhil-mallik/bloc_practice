import 'package:flutter/material.dart';

import 'ui/counter/counter_screen.dart';
import 'ui/switch_example/switch_example_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Widget showPracticeList(
        BuildContext context, String name, Widget className) {
      return Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
        child: InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => className)),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Practice'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            showPracticeList(context, 'Counter Example', const CounterScreen()),
            showPracticeList(
                context, 'Switch Example', const SwitchExampleScreen()),
          ],
        ),
      ),
    );
  }
}
