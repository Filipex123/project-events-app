import 'package:flutter/material.dart';

class SimpleModal extends StatelessWidget {
  const SimpleModal({
    Key? key,
    required this.modalTitle,
    required this.message,
    this.closeButtonText,
    this.closeCallBack
  }) : super(key: key);

  final String modalTitle;
  final String message;
  final String? closeButtonText;
  final Function? closeCallBack;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(modalTitle),
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
            if(closeCallBack != null) {
              closeCallBack!();
            }
          },
        ),
      ],
    );
  }
}