import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  /// pass title only if required to display
  final String? title;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final Icon? prefixIcon;

  const CustomTextField({
    super.key,
    this.title,
    this.hintText,
    this.initialValue,
    this.textEditingController,
    this.textInputType,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
          ),
        const SizedBox(height: 12),
        TextFormField(
          keyboardType: textInputType,
          controller: textEditingController,
          initialValue: initialValue,
          style: theme.textTheme.bodyLarge,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: const Color(0xfff5f7f9),
            isDense: true,
            hintStyle: theme.textTheme.labelLarge!.copyWith(color: const Color(0x99babec6)),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: theme.hintColor, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: theme.hintColor, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.primaryColor, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
