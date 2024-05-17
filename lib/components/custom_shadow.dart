import 'package:flutter/material.dart';

class CustomShadow extends StatelessWidget {
  const CustomShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColorDark.withOpacity(0.1),
            Theme.of(context).primaryColorDark.withOpacity(0.05),
            Colors.transparent,
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
