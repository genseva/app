import 'package:deligo/app_config/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  /// pass title only if required to display
  final String? title;
  final String hintText;
  final String? initialValue;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;

  const CustomTextField(
      {Key? key,
      this.title,
      required this.hintText,
      this.initialValue,
      this.textEditingController,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 14, color: greyTextColor),
          ),
        const SizedBox(
          height: 14,
        ),
        TextFormField(
          keyboardType: textInputType,
          controller: textEditingController,
          initialValue: initialValue,
          style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 15),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xfff5f7f9),
            // isDense: true,
            hintStyle: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: const Color(0x99babec6)),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
