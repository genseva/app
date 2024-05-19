import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({super.key, required this.title, required this.image, this.appbarBottom = const SizedBox()});
  String title;
  String image;
  Widget appbarBottom;


  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(250),
      child: Stack(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 12,
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          appbarBottom,
        ],
      ),
    );
  }
}
