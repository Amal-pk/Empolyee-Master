import 'package:flutter/material.dart';

class AddAndDeleteButton extends StatelessWidget {
  const AddAndDeleteButton({
    super.key,
    required this.buttonName,
    required this.clr,
  });
  final String buttonName;
  final Color clr;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: clr,
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            color: Colors.black,
          )
        ],
      ),
      child: Text(
        buttonName,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
