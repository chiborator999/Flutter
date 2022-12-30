import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  InputField(this.labelText, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          obscureText: false,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
          ],
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
          ),
        ));
  }
}
