import 'package:deligo/components/custom_button.dart';
import 'package:deligo/features/wallet/model/transaction_domain.dart';
import 'package:deligo/features/wallet/ui/transaction_list.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(Assets.assetsWalletBgBig),
              Positioned.fill(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Balance",
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: theme.scaffoldBackgroundColor.withOpacity(0.8),
                                    ),
                                  ),
                                  Text(
                                    r"$" " 150.50",
                                    style: theme.textTheme.headlineLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: theme.scaffoldBackgroundColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 2,
                              child: CustomButton(
                                text: "Top-up",
                                prefixIcon: Icons.add,
                                buttonColor: theme.scaffoldBackgroundColor,
                                prefixIconColor: theme.primaryColor,
                                textColor: theme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundColor: theme.scaffoldBackgroundColor,
                            radius: 24,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(start: 6),
                              child: IconButton(
                                color: theme.primaryColorDark,
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ),
                          title: const Text("GoMoney can be use for paying only"),
                          titleTextStyle: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.scaffoldBackgroundColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Container(
                        width: 80,
                        height: 4,
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: theme.hintColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TabBar(
                            indicatorColor: Colors.green,
                            labelColor: theme.primaryColor,
                            indicatorPadding: const EdgeInsetsDirectional.only(end: 20),
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            dividerHeight: 0,
                            tabs:  [
                              Tab(text: locale.allTransactions),
                              Tab(text: locale.topUps),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ColoredBox(
                        color: theme.disabledColor,
                        child: TabBarView(
                          children: [
                            TransactionList(list: TransactionDomain.list),
                            TransactionList(list: TransactionDomain.topUps),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
