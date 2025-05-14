import 'package:flutter/material.dart';

class PasswordRequirement extends StatelessWidget {
  final String requirement;
  final bool isValid;

  const PasswordRequirement({
    super.key,
    required this.requirement,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.cancel,
          color: isValid ? Colors.green : Colors.red,
          size: 18,
        ),
        SizedBox(width: 6),
        Text(requirement, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
