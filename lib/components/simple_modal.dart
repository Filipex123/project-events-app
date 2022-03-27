import 'dart:developer';

import 'package:flutter/material.dart';

class SimpleModal extends StatelessWidget {
  const SimpleModal({
    Key? key,
    required this.text,
    this.closeButtonText
    // required this.icon,
    // required this.hint,
    // this.inputType,
    // this.inputAction,
    // this.handleOnChange
  }) : super(key: key);

  final String text;
  final String? closeButtonText;
  // final IconData icon;
  // final String hint;
  // final TextInputType? inputType;
  // final TextInputAction? inputAction;
  // final Function(String)? handleOnChange;

  List<Widget> _buildChildren(BuildContext context) {
    List<Widget> children = [Text(text)];
  
    if (closeButtonText != null) {
      children.add(ElevatedButton(
              child: Text(closeButtonText ?? ''),
              onPressed: () => Navigator.pop(context),
            ));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: _buildChildren(context),
        ),
      ),
    );
  }
}
