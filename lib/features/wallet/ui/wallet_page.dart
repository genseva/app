import 'package:deligo/generated/assets.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(Assets.assetsWalletBgBig),
          SafeArea(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.wallet,
                    size: 36,
                    color: theme.scaffoldBackgroundColor,
                  ),
                  title: const Text("GoWallet"),
                  titleTextStyle: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.scaffoldBackgroundColor,
                  ),
                ),
                Row(
                  children: [],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
