import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  /// pass title only if required to display
  final String? title;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final Icon? suffixIcon;
  final int? maxLines;
  final Color? bgColor;
  final bool showBorder;
  final bool readOnly;
  final VoidCallback? onTap;

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
    this.bgColor,
    this.onTap,
    this.showBorder = true,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
          ),
          const SizedBox(height: 12),
        ],
        TextFormField(
          keyboardType: textInputType,
          controller: textEditingController,
          initialValue: initialValue,
          style: theme.textTheme.bodyLarge,
          maxLines: maxLines,
          onTap: onTap,
          readOnly: readOnly,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: bgColor ?? theme.cardColor,
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

  InputBorder _getBorder(Color color) {
    if (showBorder) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: color.withOpacity(0.3), width: 0.5),
        borderRadius: BorderRadius.circular(10),
      );
    } else {
      return InputBorder.none;
    }
  }
}
