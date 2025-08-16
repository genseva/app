import '../../../generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PortfolioTab extends StatelessWidget {
  const PortfolioTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> portfolio = [
      Assets.portfoliosP1,
      Assets.portfoliosP2,
      Assets.portfoliosP3,
      Assets.portfoliosP4,
      Assets.portfoliosP2,
      Assets.portfoliosP6,
      Assets.portfoliosP4,
      Assets.portfoliosP5,
      Assets.portfoliosP6,
    ];
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            axisDirection: AxisDirection.down,
            children: [
              for (var i = 0; i < portfolio.length; i++)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    portfolio[i],
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
