import 'package:deligo/components/option_tile.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<(IconData, String, VoidCallback?)> options = [
      (
        Icons.location_on,
        "Saved Addresses",
        () => Navigator.pushNamed(context, PageRoutes.savedAddressesPage),
      ),
      (
        Icons.mail,
        "Support & FAQs",
        () => Navigator.pushNamed(context, PageRoutes.supportPage),
      ),
      (
        Icons.language,
        "Change Language",
        () => Navigator.pushNamed(context, PageRoutes.languagePage),
      ),
      (
        Icons.assignment,
        "Terms & Conditions",
        () => Navigator.pushNamed(context, PageRoutes.tncPage),
      ),
      (
        Icons.logout,
        "Logout",
        () => Phoenix.rebirth(context),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Samantha Smith",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "+1 987 654 3210",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.unselectedWidgetColor,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.profilePage);
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        Assets.assetsUser,
                        height: MediaQuery.of(context).size.width * 0.2,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      PositionedDirectional(
                        start: -36,
                        height: MediaQuery.of(context).size.width * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: theme.scaffoldBackgroundColor,
                                border: Border.all(color: theme.hintColor),
                              ),
                              child: Icon(Icons.edit, color: theme.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.walletPage);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(Assets.assetsWalletBg),
                  ListTile(
                    titleAlignment: ListTileTitleAlignment.top,
                    leading: Icon(
                      Icons.wallet,
                      color: theme.scaffoldBackgroundColor,
                      size: 36,
                    ),
                    title: Text(
                      "GoWallet",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.scaffoldBackgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      r"$" " 150.50",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.scaffoldBackgroundColor.withOpacity(0.8),
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: theme.scaffoldBackgroundColor,
                      size: 32,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Account Options",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.unselectedWidgetColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  var option = options[index];
                  return OptionTile(title: option.$2, icon: option.$1, onTap: option.$3);
                },
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: options.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
