import 'package:deligo/features/bottom_navigation/home/home_screen.dart';
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
    var appLocalization = AppLocalizations.of(context);
    final List<BottomNavigationBarItem> barItems = [
      const BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home),
      ),
      const BottomNavigationBarItem(
        label: 'Offers',
        icon: Icon(Icons.home),
      ),
      const BottomNavigationBarItem(
        label: 'Orders',
        icon: Icon(Icons.home),
      ),
    ];

    final List<Widget> _children = [
      HomeScreen(),
      const FlutterLogo(),
      const FlutterLogo(),
    ];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
        currentIndex: _currentIndex,
        elevation: 20,
        items: barItems,
      ),
    );
  }
}
