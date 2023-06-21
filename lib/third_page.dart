import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});
  static const name = '/thirdPage';

  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data,
              style: TextStyle(color: Colors.blueGrey.shade100, fontSize: 22),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueGrey.shade100)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Exit',
                  style: TextStyle(color: Colors.blueGrey),
                )),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
