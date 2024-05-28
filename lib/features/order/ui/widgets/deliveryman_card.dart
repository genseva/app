import 'package:deligo/generated/assets.dart';
import 'package:flutter/material.dart';

class DeliverymanCard extends StatelessWidget {
  const DeliverymanCard(this.isDelivered, {super.key});

  final bool isDelivered;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isDelivered)
                Text(
                  "Deliveryman Assigned",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.hintColor,
                  ),
                ),
              const SizedBox(height: 6),
              Text(
                "George Anderson",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "KLV - 1234",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.hintColor,
                ),
              ),
            ],
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                Assets.assetsUser,
                height: MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              if (!isDelivered)
                PositionedDirectional(
                  start: -36,
                  bottom: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.scaffoldBackgroundColor,
                      border: Border.all(color: theme.hintColor),
                    ),
                    child: Icon(Icons.call, color: theme.primaryColor),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
