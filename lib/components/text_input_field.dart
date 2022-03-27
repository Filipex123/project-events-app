import 'package:brota_ai_app/components/paleta.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.icon,
    required this.hint,
    this.inputType,
    this.inputAction,
    this.handleOnChange,
    this.controller
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Function(String)? handleOnChange;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: size.height * 0.08,
        width: size.width - 32,
        child: Center(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFD6822C), width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              hintText: hint,
              hintStyle: kInputText,
              filled: true,
              fillColor: Colors.white,
            ),
            style: kInputText,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}
