import 'package:brota_ai_app/components/paleta.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {Key? key,
      this.icon,
      this.iconSize,
      required this.hint,
      this.inputType,
      this.inputAction,
      this.maxLength,
      this.isPassword,
      this.handleOnChange,
      this.controller,
      this.hadWidth,
      this.hadHeight})
      : super(key: key);

  final IconData? icon;
  final double? iconSize;
  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final int? maxLength;
  final bool? isPassword;
  final Function(String)? handleOnChange;
  final TextEditingController? controller;
  final double? hadWidth;
  final double? hadHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        height: size.height * (hadHeight ?? 0.08),
        width: size.width - (hadWidth ?? 32),
        child: Center(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFD6822C),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: hadIcon(icon),
                hintText: hint,
                hintStyle: kHintInputText,
                filled: true,
                fillColor: Colors.white,
                counterText: ''),
            maxLength: maxLength,
            obscureText: isPassword ?? false,
            style: kInputText,
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }

  hadIcon(IconData? icon) {
    if (icon != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Icon(
          icon,
          size: iconSize ?? 28,
          color: Colors.black.withOpacity(0.3),
        ),
      );
    }
    return null;
  }
}
