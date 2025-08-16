import '../../../components/custom_divider.dart';
import '../../../components/custom_rating_bar_indicator.dart';
import '../../common/model/reviewer_domain.dart';
import 'package:flutter/material.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          var reviewer = ReviewerDomain.reviewerList[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(reviewer.image, height: 60),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reviewer.name,
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomRatingBarIndicator(reviewer.rating),
                          const Expanded(child: SizedBox()),
                          Text(reviewer.date,
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: theme.hintColor)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const CustomDivider()
                    ]),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: ReviewerDomain.reviewerList.length);
  }
}
