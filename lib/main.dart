import 'package:flutter/material.dart';
import 'package:flutter_animations/pages/animation_controller_page.dart';
import 'package:flutter_animations/pages/implicit_animated_container_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animations')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  //* Buttons for animations
                  //? Implicit Animation Controller
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ImplicitAnimatedContainerPage(),
                        ),
                      );
                    },
                    child: const Text('Implicit Animated Container'),
                  ),
                  const SizedBox(height: 10),
                  //? Animation Controller
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AnimationControllerPage(),
                        ),
                      );
                    },
                    child: const Text('Animation Controller'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
