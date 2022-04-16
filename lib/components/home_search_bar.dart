import 'package:brota_ai_app/components/paleta.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.inputAction,
    this.maxLength,
    required this.handleOnTap,
    this.controller,
  }) : super(key: key);

  final TextInputAction? inputAction;
  final int? maxLength;
  final Function() handleOnTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.1),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFD6822C),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Icon(
            FontAwesomeIcons.search,
            size: 22,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Pesquisar eventos',
        hintStyle: TextStyle(
          fontSize: 22,
          fontFamily: 'ABeeZee',
          color:Colors.black.withOpacity(0.2),
        ),
      ),
      style: const TextStyle(
        fontSize: 22,
        fontFamily: 'ABeeZee',
        color: Colors.black,
      ),
      onTap: handleOnTap,
    );
  }
}
