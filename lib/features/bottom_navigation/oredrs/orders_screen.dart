import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          leading: null,
          title: Text(
            "Orders",
            style:
                theme.textTheme.headlineLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.accountPage);
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: theme.primaryColor,
                child: Icon(
                  Icons.person,
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
