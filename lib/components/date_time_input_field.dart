import 'package:brota_ai_app/components/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:brota_ai_app/components/paleta.dart';

class BasicDateTimeField extends StatefulWidget {
  BasicDateTimeField(
      {Key? key,
      required this.dateTimeController,
      required this.handleOnChange})
      : super(key: key);

  Function handleOnChange;
  TextEditingController dateTimeController = TextEditingController();

  @override
  _BasicDateTimeFieldState createState() => _BasicDateTimeFieldState();
}

class _BasicDateTimeFieldState extends State<BasicDateTimeField> {
  //Function(String?)? handleOnChange;
  late DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        height: size.height * 0.08,
        width: size.width - 32,
        child: Center(
          child: TextField(
            controller: widget.dateTimeController,
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
                    FontAwesomeIcons.clock,
                    size: 28,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                hintText: 'Data / Hora',
                hintStyle: kHintInputText,
                filled: true,
                fillColor: Colors.white,
                counterText: ''),
            obscureText: false,
            style: kInputText,
            keyboardType: TextInputType.none,
            textInputAction: TextInputAction.next,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null) {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                );

                DateTime dateTime =
                    DateTimeField.combine(pickedDate, pickedTime);

                String formattedDate =
                    DateFormat('dd/MM/yyyy HH:mm').format(dateTime);

                setState(() {
                  widget.dateTimeController.text = formattedDate;

                  widget.handleOnChange();
                });
              } else {
                setState(() {
                  widget.dateTimeController.text = 'Nenhuma data selecionada';
                });
              }
            },
          ),
        ),
      ),
    );
  }
}

// DateTimeField(
//       format: DateFormat("yyyy-MM-dd HH:mm"),
//       onShowPicker: (context, currentValue) async {
//         final date = await showDatePicker(
//             context: context,
//             firstDate: DateTime(1900),
//             initialDate: currentValue ?? DateTime.now(),
//             lastDate: DateTime(2100));
//         if (date != null) {
//           final time = await showTimePicker(
//             context: context,
//             initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//           );
//           if (handleOnChange != null) {
//             handleOnChange!(DateTimeField.combine(date, time));
//           }
//           return DateTimeField.combine(date, time);
//         } else {
//           return currentValue;
//         }
//       },
//     );
