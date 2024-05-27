import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GetRating {
  final String question;
  double rating;

  GetRating(this.question, this.rating);

  static List<GetRating> list = [
    GetRating("How was driver service?", 0),
    GetRating("How was food?", 0),
  ];
}

class GetRatingCard extends StatefulWidget {
  const GetRatingCard({super.key});

  @override
  State<GetRatingCard> createState() => _GetRatingCardState();
}

class _GetRatingCardState extends State<GetRatingCard> {
  final PageController _controller = PageController();
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
      color: theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          Flexible(
            child: PageView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: GetRating.list.length,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return _ratingContent(theme);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildIndicator(),
          )
        ],
      ),
    );
  }

  Column _ratingContent(ThemeData theme) {
    return Column(
      children: [
        Text(GetRating.list.first.question),
        const SizedBox(height: 6),
        RatingBar(
          ratingWidget: RatingWidget(
            empty: Icon(
              Icons.star,
              color: theme.highlightColor.withOpacity(0.3),
              size: 12,
            ),
            full: Icon(
              Icons.star,
              color: Colors.yellow.shade700,
              size: 12,
            ),
            half: Icon(
              Icons.star_half,
              color: Colors.yellow.shade700,
              size: 12,
            ),
          ),
          onRatingUpdate: (rating) {
            setState(() {
              GetRating.list.first.rating = rating;
            });
          },
          allowHalfRating: true,
        ),
      ],
    );
  }

  //Indicator Builder
  List<Widget> _buildIndicator() {
    final indicators = <Widget>[];

    for (var i = 0; i < GetRating.list.length; i++) {
      if (_activePage == i) {
        indicators.add(_indicatorsTrue());
      } else {
        indicators.add(_indicatorsFalse());
      }
    }
    return indicators;
  }

  Widget _indicatorsTrue() {
    //Active Indicator
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).hintColor,
      ),
    );
  }

  //Inactive Indicator
  Widget _indicatorsFalse() {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).highlightColor.withOpacity(0.3),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
