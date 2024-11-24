import 'package:flutter/material.dart';


class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.label, required this.onPressed});

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(1, 1),
              ),
            ]
        ),
        child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
      ),
    );
  }
}