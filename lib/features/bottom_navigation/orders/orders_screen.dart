import 'package:deligo/features/bottom_navigation/orders/order_history_list.dart';
import 'package:deligo/features/wallet/model/transaction_domain.dart';
import 'package:deligo/features/wallet/ui/transaction_list.dart';
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
        body: DefaultTabController(
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
                        tabs: const [
                          Tab(text: "Ongoing"),
                          Tab(text: "History"),
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
                        TransactionList(list: TransactionDomain.topUps),
                        const OrderHistoryList()

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
