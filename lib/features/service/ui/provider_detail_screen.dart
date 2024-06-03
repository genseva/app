import 'package:deligo/features/common/model/store_domain.dart';
import 'package:deligo/features/food/ui/widgets/custom_info_widget.dart';
import 'package:deligo/features/service/ui/widgets/portfolio_tab.dart';
import 'package:deligo/features/service/ui/widgets/reviews_tab.dart';
import 'package:deligo/features/service/ui/widgets/select_service_date.dart';
import 'package:deligo/features/service/ui/widgets/services_tab.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProviderDetailScreen extends StatelessWidget {
  const ProviderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = ModalRoute.of(context)?.settings.arguments as StoreDomain;
    final theme = Theme.of(context);
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios_new),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        provider.name,
                        style: theme.textTheme.headlineSmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        provider.location,
                        style: theme.textTheme.bodySmall!
                            .copyWith(fontSize: 12, color: theme.hintColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    provider.image,
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
            ),
            const Divider(thickness: 0.4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomInfoWidget(Icons.star, "120+ ratings", "4.2"),
                  CustomInfoWidget(Icons.work_history_outlined, locale.jobDone, "148"),
                  CustomInfoWidget(Icons.payments, locale.priceRange, r"$20.00/hr"),
                ],
              ),
            ),
            const Divider(thickness: 0.4),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TabBar(
                            tabs: [
                              Tab(text: locale.services),
                              Tab(text: locale.portfolio),
                              Tab(text: locale.reviews),
                            ],
                            indicatorColor: theme.primaryColor,
                            labelColor: theme.primaryColor,
                            labelStyle:
                                theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                            unselectedLabelStyle: theme.textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ColoredBox(
                        color: theme.disabledColor,
                        child: TabBarView(
                          children: [
                            ServicesTab(provider),
                            const PortfolioTab(),
                            const ReviewsTab(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const SelectServiceDate(),
    );
  }
}
