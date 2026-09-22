import 'package:flutter/material.dart';

//* Animation Controller : 0.0 ile 1.0 arasında değer üretir.
//* vsync parametresi ister (TickerProvider)
//* .forward(), .reverse(), .repeat(), .stop() gibi metodları vardır.

class AnimationControllerPage extends StatefulWidget {
  const AnimationControllerPage({super.key});

  @override
  State<AnimationControllerPage> createState() =>
      _AnimationControllerPageState();
}

class _AnimationControllerPageState extends State<AnimationControllerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Çok Önemli !!! (yapılmaz ise bellek sızıntısı olur.)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimationController')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Controller'ın değerini dinleyip gösteriyoruz.
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  width: 100 + (_controller.value * 150),
                  height: 100 + (_controller.value * 150),
                  color: Colors.purple.withValues(
                    alpha: 0.3 + _controller.value * 0.7,
                  ),
                  child: Center(
                    child: Text(
                      _controller.value.toStringAsFixed(2),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.forward(),
                  child: Text('İleri'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _controller.reverse(),
                  child: const Text('Geri'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _controller.reset(),
                  child: const Text('Sıfırla'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _controller.repeat(reverse: true),
                  child: const Text('Tekrarla'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
