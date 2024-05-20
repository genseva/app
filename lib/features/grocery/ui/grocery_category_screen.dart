import 'package:flutter/material.dart';

class GroceryCategoryScreen extends StatelessWidget {
  const GroceryCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Mega mart 24x7"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: TabBar(
        tabs: [

        ],

      ),
    );
  }
}
