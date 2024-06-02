import 'package:deligo/features/bottom_navigation/home/home_screen.dart';
import 'package:deligo/features/bottom_navigation/offers/offers_screen.dart';
import 'package:deligo/features/bottom_navigation/orders/orders_screen.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    final List<BottomNavigationBarItem> barItems = [
      BottomNavigationBarItem(
        label: locale.home,
        icon: const Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: locale.offers,
        icon: const Icon(Icons.discount_rounded),
      ),
      BottomNavigationBarItem(
        label: locale.orders,
        icon: const Icon(Icons.assignment_outlined),
      ),
    ];

    final List<Widget> children = [
      HomeScreen(),
      const OffersScreen(),
      const OrdersScreen(),
    ];
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        onTap: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
        currentIndex: _currentIndex,
        elevation: 5,
        items: barItems,
      ),
    );
  }
}
