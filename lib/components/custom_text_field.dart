import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  /// pass title only if required to display
  final String? title;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final int? maxLines;

  const CustomTextField({
    super.key,
    this.title,
    this.hintText,
    this.initialValue,
    this.textEditingController,
    this.textInputType,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
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
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: const Color(0xfff5f7f9),
            isDense: true,
            border: _getBorder(theme.hintColor),
            enabledBorder: _getBorder(theme.hintColor),
            focusedBorder: _getBorder(theme.primaryColor),
            hintText: hintText,
            hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _getBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 0.5),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
