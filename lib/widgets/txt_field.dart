import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(20),
      ],
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: AppFonts.bold,
      ),
      decoration: InputDecoration(hintText: hintText),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: onChanged,
    );
  }
}
