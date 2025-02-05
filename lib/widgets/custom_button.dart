import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomIconButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Container(
          padding: EdgeInsets.all(2.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33),
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: Icon(Icons.arrow_forward_ios_outlined)),
    );
  }
}
