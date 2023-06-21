import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_transition/second_page.dart';
import 'package:navigation_transition/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Page Transition'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Main Page',
            style: TextStyle(color: Colors.blueGrey, fontSize: 28),
          ),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blueGrey)),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const SecondPage();
                  },
                  transitionDuration: const Duration(milliseconds: 300),
                  reverseTransitionDuration: const Duration(milliseconds: 300),
                  settings: const RouteSettings(
                      name: SecondPage.name,
                      arguments: 'Second Page launched. From MainPage'),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return ScaleTransition(
                      scale: animation,
                      alignment: Alignment.center,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ));
              },
              child: Text(
                'Go to SecondPage',
                style: TextStyle(
                  color: Colors.blueGrey.shade100,
                ),
              )),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blueGrey)),
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const ThirdPage();
                    },
                    settings: const RouteSettings(
                        name: ThirdPage.name,
                        arguments: 'ThirdPage launched. From MainPage.'),
                    transitionDuration: const Duration(milliseconds: 1000),
                    reverseTransitionDuration:
                        const Duration(milliseconds: 700),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: animation
                            .drive(CurveTween(curve: Curves.bounceOut))
                            .drive(Tween(
                                begin: const Offset(0, 1),
                                end: const Offset(0, 0))),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text(
                'Go to ThirdPage',
                style: TextStyle(
                  color: Colors.blueGrey.shade100,
                ),
              ))
        ],
      )),
    );
  }
}
