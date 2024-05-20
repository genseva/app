import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? buttonColor;
  final Color? textColor;
  final String? prefix;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final Function()? onTap;

  const CustomButton({
    super.key,
    this.text,
    this.buttonColor,
    this.prefix,
    this.prefixIcon,
    this.onTap,
    this.prefixIconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xffebebeb)),
            borderRadius: BorderRadius.circular(10))),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20)),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(buttonColor ?? theme.primaryColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 18.0),
              child: Icon(prefixIcon!, color: prefixIconColor),
            ),
          if (prefix != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 18.0),
              child: Image.asset(
                prefix!,
                height: 16,
                width: 16,
              ),
            ),
          SizedBox(width: prefix != null || prefixIcon != null ? 10 : 0),
          Text(
            text ?? 'Continue',
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: textColor ?? theme.scaffoldBackgroundColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(width: prefix != null || prefixIcon != null ? 10 : 0),
        ],
      ),
    );
  }
}
