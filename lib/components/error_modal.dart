import 'package:flutter/material.dart';

class ErrorModal extends StatelessWidget {
  const ErrorModal({
    Key? key,
    required this.message,
    this.closeButtonText,
    this.modalTitle,
  }) : super(key: key);

  final String? modalTitle;
  final String message;
  final String? closeButtonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(modalTitle ?? "Erro"),
      content: Text(message,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      actions: [
        TextButton(
          child: Text(closeButtonText ?? "OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}