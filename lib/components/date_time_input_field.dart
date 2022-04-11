import 'package:brota_ai_app/components/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:brota_ai_app/components/paleta.dart';

class BasicDateTimeField extends StatefulWidget {
  const BasicDateTimeField({Key? key}) : super(key: key);

  @override
  _BasicDateTimeFieldState createState() => _BasicDateTimeFieldState();
}

class _BasicDateTimeFieldState extends State<BasicDateTimeField> {
  Function(DateTime?)? handleOnChange;
  late DateTime _selectedDate;
  TextEditingController dateTimeController = TextEditingController();

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
            controller: dateTimeController,
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
            textInputAction: TextInputAction.next,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null) {
                await showTimePicker(
                  context: context,
                  initialTime:
                      // TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                      TimeOfDay.fromDateTime(DateTime.now()),
                );
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);

                setState(() {
                  dateTimeController.text = formattedDate;
                });
              } else {
                setState(() {
                  dateTimeController.text = 'Nenhuma data selecionada';
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
