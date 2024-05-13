import 'package:deligo/features/screens/food/model/restaurant_domain.dart';
import 'package:deligo/features/screens/food/ui/widgets/custom_info_widget.dart';
import 'package:flutter/material.dart';

class RestaurantProfilePage extends StatelessWidget {
  const RestaurantProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantDomain data = ModalRoute.of(context)?.settings.arguments as RestaurantDomain? ??
        RestaurantDomain.restaurantList.first;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  data.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "${data.location} • ",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
                    ),
                    Text(
                      "1.5 km",
                      style:
                          Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInfoWidget(Icons.star, "60+ ratings", "4.2"),
                CustomInfoWidget(Icons.directions_bike_outlined, "Delivery in", "20 min"),
                CustomInfoWidget(Icons.restaurant_menu, "Price Range", r"$$$$"),
              ],
            ),
          ),
          Container(
            height: 30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColorDark.withOpacity(0.1),
                  Theme.of(context).primaryColorDark.withOpacity(0.05),
                  Colors.transparent,
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
