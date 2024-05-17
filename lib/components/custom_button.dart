import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? buttonColor;
  final String? prefixIcon;
  final Function()? onTap;

  const CustomButton({super.key, this.text, this.buttonColor, this.prefixIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xffebebeb)),
              borderRadius: BorderRadius.circular(10))),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20)),
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
              MaterialStateProperty.all(buttonColor ?? Theme.of(context).primaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 18.0),
              child: Image.asset(
                prefixIcon!,
                height: 16,
                width: 16,
              ),
            ),
          Expanded(
            child: Text(
              text ?? 'Continue',
              style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: buttonColor == Theme.of(context).scaffoldBackgroundColor
                      ? Colors.black
                      : Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
