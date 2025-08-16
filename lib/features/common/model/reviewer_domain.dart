import 'package:genseva/generated/assets.dart';

class ReviewerDomain {
  final String name;
  final String image;
  final String date;
  final double rating;

  ReviewerDomain(
      {required this.name,
      required this.image,
      required this.date,
      required this.rating});

  static final List<ReviewerDomain> reviewerList = [
    ReviewerDomain(
        name: "John Doe",
        image: Assets.reviewerReviewer1,
        date: "20 May, 2024",
        rating: 4.5),
    ReviewerDomain(
        name: "Ronald Doe",
        image: Assets.reviewerReviewer2,
        date: "21 May, 2024",
        rating: 3.0),
    ReviewerDomain(
        name: "Melinda Doe",
        image: Assets.reviewerReviewer3,
        date: "22 May, 2024",
        rating: 4.5),
    ReviewerDomain(
        name: "Samantha Doe",
        image: Assets.reviewerReviewer4,
        date: "23 May, 2024",
        rating: 2.7),
    ReviewerDomain(
        name: "Jay Doe",
        image: Assets.reviewerReviewer5,
        date: "24 May, 2024",
        rating: 3.5),
    ReviewerDomain(
        name: "Ela Doe",
        image: Assets.reviewerReviewer6,
        date: "25 May, 2024",
        rating: 2.5),
    ReviewerDomain(
        name: "Joe Doe",
        image: Assets.reviewerReviewer1,
        date: "26 May, 2024",
        rating: 3.5),
  ];
}
