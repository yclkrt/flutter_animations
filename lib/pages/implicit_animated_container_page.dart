import 'package:flutter/material.dart';

/**
 * Kavram
 *
 * Container widget'ını biliyorsun. AnimatedContainer ise aynı container'dır, ama özellikleri (renk,boyut,padding,vs.) değiştiğinde otomatik olarak animasyonla geçiş yapar.
 * Sen sadece duration verirsin, gerisini Flutter halleder.
 */

class ImplicitAnimatedContainerPage extends StatefulWidget {
  const ImplicitAnimatedContainerPage({super.key});

  @override
  State<ImplicitAnimatedContainerPage> createState() =>
      _ImplicitAnimatedContainerPageState();
}

class _ImplicitAnimatedContainerPageState
    extends State<ImplicitAnimatedContainerPage> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Implicit Animated Container')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: _isExpanded ? 250 : 100,
            width: _isExpanded ? 250 : 100,
            decoration: BoxDecoration(
              color: _isExpanded ? Colors.blue : Colors.red,
              borderRadius: BorderRadius.circular(_isExpanded ? 125 : 12),
            ),
            child: const Center(
              child: Text(
                'Dokun!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
