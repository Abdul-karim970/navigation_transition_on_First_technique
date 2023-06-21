import 'package:flutter/material.dart';
import 'package:navigation_transition/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  static const name = '/secondPage';

  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 74, 85),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data,
              style: TextStyle(color: Colors.blueGrey.shade100, fontSize: 20),
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
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                )),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueGrey.shade100)),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const ThirdPage();
                      },
                      settings: const RouteSettings(
                          name: ThirdPage.name,
                          arguments: 'ThirdPage launched. From MainPage.'),
                      transitionDuration: const Duration(milliseconds: 1500),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 700),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: animation
                              .drive(CurveTween(curve: Curves.elasticOut))
                              .drive(Tween(
                                  begin: const Offset(0, -1),
                                  end: const Offset(0, 0))),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: const Text(
                  'Go to Third',
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
