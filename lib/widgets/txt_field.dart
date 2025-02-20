import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TxtField extends StatelessWidget {
  const TxtField({
    super.key,
    required this.controller,
    required this.hintText,
    this.number = false,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
  });

  final TextEditingController controller;
  final String hintText;
  final bool number;
  final bool readOnly;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          keyboardType: number ? TextInputType.number : null,
          readOnly: readOnly,
          inputFormatters: [
            LengthLimitingTextInputFormatter(50),
            if (number) FilteringTextInputFormatter.digitsOnly,
          ],
          textCapitalization: TextCapitalization.sentences,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'w600',
          ),
          decoration: InputDecoration(hintText: hintText),
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: onChanged,
          onTap: onTap,
        ),
      ),
    );
  }
}
