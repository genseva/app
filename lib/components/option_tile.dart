import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    this.image,
    required this.title,
    this.isCard = false,
    this.icon,
    this.onTap,
  });

  final IconData? icon;
  final String? image;
  final bool isCard;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        height: 54,
        child: Row(
          children: [
            if (icon != null)
              Container(
                padding: const EdgeInsets.all(2),
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    color: theme.primaryColor, borderRadius: BorderRadius.circular(8)),
                child: Icon(
                  icon!,
                  color: theme.scaffoldBackgroundColor,
                  size: 20,
                ),
              ),
            if (image != null)
              Align(
                alignment: isCard ? Alignment.bottomCenter : Alignment.center,
                child: Image.asset(
                  image!,
                  width: isCard ? 40 : 32,
                ),
              ),
            const SizedBox(width: 24),
            Text(
              title,
              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
