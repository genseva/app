import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/cart/ui/cart_bottom_bar.dart';
import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:deligo/features/grocery/ui/grocery_item_card.dart';
import 'package:flutter/material.dart';

class GroceryCategoryScreen extends StatefulWidget {
  const GroceryCategoryScreen({super.key});

  @override
  State<GroceryCategoryScreen> createState() => _GroceryCategoryScreenState();
}

class _GroceryCategoryScreenState extends State<GroceryCategoryScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: CategoryDomain.groceryList.length, vsync: this)
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
    final theme = Theme.of(context);
    final StoreDomain store = ModalRoute.of(context)?.settings.arguments as StoreDomain;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Megamart 24x7"),
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
                tabs: CategoryDomain.groceryList.map((e) => Tab(text: e.title)).toList(),
              ))
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                ...List.generate(CategoryDomain.groceryList.length, (categoryIndex) {
                  return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: false,
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, crossAxisSpacing: 5, childAspectRatio: 0.55),
                      itemCount: CategoryDomain.groceryList[categoryIndex].items.length,
                      itemBuilder: (context, index) {
                        var category = CategoryDomain.groceryList[categoryIndex];
                        return GroceryItemCard(category.items[index]);
                      });
                })
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CartBottomBar(store),
    );
  }
}
