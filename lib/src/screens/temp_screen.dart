import 'package:flutter/material.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    return Scaffold(
      appBar: AppBar(
        title: Text("TempScreen"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                print(currentRoute);
              },
              child: Text("Test Button")),
          const Text("Temp Screen"),
        ],
      ),
    );
  }
}
