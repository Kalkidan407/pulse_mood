import 'package:flutter/material.dart';

class AnimatedButtonExample extends StatefulWidget {
  const AnimatedButtonExample({super.key});

  @override
  State<AnimatedButtonExample> createState() => _AnimatedButtonExampleState();
}

class _AnimatedButtonExampleState extends State<AnimatedButtonExample> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),   // press down
        onTapUp: (_) => setState(() => _isPressed = false),    // release
        onTapCancel: () => setState(() => _isPressed = false), // cancel
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200), // animation speed
          curve: Curves.easeInOut,
          transform: Matrix4.identity()
            ..scale(_isPressed ? 0.95 : 1.0), // shrink on press
          child: ElevatedButton(
            onPressed: () {
              // Your action here
              print("Button pressed!");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _isPressed ? Colors.amber.shade700 : Colors.amber,
              elevation: _isPressed ? 2 : 8, // shadow lowers when pressed
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Animated Button"),
          ),
        ),
      ),
    );
  }
}
// 