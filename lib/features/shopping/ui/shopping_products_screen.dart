import 'package:deligo/components/add_button.dart';
import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/cart/ui/cart_bottom_bar.dart';
import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:flutter/material.dart';

class ShoppingProducts extends StatefulWidget {
  const ShoppingProducts({super.key});

  @override
  State<ShoppingProducts> createState() => _ShoppingProductsState();
}

class _ShoppingProductsState extends State<ShoppingProducts> with SingleTickerProviderStateMixin {
  late final TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: CategoryDomain.ecommerceList[0].subCategories!.length, vsync: this)
          ..addListener(() {
            _updateIndex(_controller.index);
          });
  }

  _updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    (CategoryDomain, String) args =
        ModalRoute.of(context)?.settings.arguments as (CategoryDomain, String);
    var category = args.$1;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(category.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          const CustomDivider(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.assignment,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Expanded(
                  child: TabBar(
                indicatorColor: Colors.green,
                labelColor: theme.primaryColor,
                indicatorPadding: const EdgeInsetsDirectional.only(end: 20),
                tabAlignment: TabAlignment.center,
                dividerColor: theme.cardColor,
                isScrollable: true,
                controller: _controller,
                dividerHeight: 1,
                tabs: CategoryDomain.ecommerceList.first.subCategories!
                    .map((e) => Tab(text: e))
                    .toList(),
              ))
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                ...List.generate(CategoryDomain.ecommerceList.first.subCategories!.length,
                    (categoryIndex) {
                  return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: false,
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: CategoryDomain.ecommerceList[0].items.length,
                      itemBuilder: (context, index) {
                        var product = CategoryDomain.ecommerceList[0];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(product.items[index].image)),
                            const SizedBox(height: 8),
                            Text(product.items[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: theme.hintColor)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(r"$" + product.items[index].price.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w500)),
                                const Spacer(),
                                AddItemButton(product: product.items[index]),
                              ],
                            )
                          ],
                        );
                      });
                })
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CartBottomBar(StoreDomain.ecommerce.first),
    );
  }
}
