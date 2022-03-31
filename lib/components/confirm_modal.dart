import 'package:flutter/material.dart';

class ConfirmModal extends StatelessWidget {
  const ConfirmModal({
    Key? key,
    required this.modalTitle,
    required this.message,
    this.confirmButtonText,
    this.cancelButtonText,
    this.confirmCallback,
    this.cancelCallback
  }) : super(key: key);

  final String modalTitle;
  final String message;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final Function? confirmCallback;
  final Function? cancelCallback;

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
          child: Text(cancelButtonText ?? "Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
            if(cancelCallback != null) {
              cancelCallback!();
            }
          },
        ),
        TextButton(
          child: Text(confirmButtonText ?? "Confirmar"),
          onPressed: () {
            Navigator.of(context).pop();
            if(confirmCallback != null) {
              confirmCallback!();
            }
          },
        ),
      ],
    );
  }
}