import 'dart:developer';

import 'package:brota_ai_app/components/paleta.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatelessWidget {
  const DateInputField({
    Key? key,
    required this.icon,
    required this.hint,
    this.handleOnChange,
    this.controller,
    this.validator
  }): super(key: key);

  final IconData icon;
  final String hint;
  final Function(DateTime?)? handleOnChange;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: size.height * 0.08,
        width: size.width - 32,
        child: Center(
          child: TextFormField(
            controller: controller,
            validator: validator,
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
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    icon,
                    size: 28,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                hintText: hint,
                hintStyle: kHintInputText,
                filled: true,
                fillColor: Colors.white,
                counterText: '',
              ),
            style: kInputText,
            readOnly: true,
            onTap: () async {
              DateTime dateNow = DateTime.now();
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(dateNow.year - 7, dateNow.month, dateNow.day),
                firstDate: DateTime(dateNow.year - 150),
                lastDate: DateTime(dateNow.year - 7, dateNow.month, dateNow.day),
              );
              if(pickedDate != null){
                  String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate); 
                  controller?.text = formattedDate;
                  if(handleOnChange != null) {
                    handleOnChange!(pickedDate);
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
