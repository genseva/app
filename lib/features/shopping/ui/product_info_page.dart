import 'package:deligo/components/rating_card.dart';
import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/generated/assets.dart';
import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  const ProductInfoPage({super.key});

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  @override
  Widget build(BuildContext context) {
    List<String> sizes = [
      'S',
      'M',
      'L',
      'XL',
      '2XL',
      '3XL',
    ];
    var theme = Theme.of(context);
    ProductDomain product = ModalRoute.of(context)?.settings.arguments as ProductDomain;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(product.image),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.keyboard_arrow_left),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.favorite),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                              child: Text(product.name,
                                  style: theme.textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w600))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const RatingCard(rating: "4.8"),
                              const SizedBox(height: 5),
                              Text(
                                "138 Reviews",
                                style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Select Size",
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 50,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: theme.hintColor),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                      child: Text(
                                    sizes[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  )),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(width: 10),
                            itemCount: sizes.length),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Select Size",
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[800]),
                      ),
                      const SizedBox(height: 16),
                      Image.asset(Assets.productsStore, height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
