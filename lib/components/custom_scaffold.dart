import 'package:deligo/components/widget_size.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    super.key,
    required this.image,
    required this.title,
    required this.child,
    this.bgColor,
  });

  final String image;
  final String title;
  final Widget child;
  final Color? bgColor;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  Size? headerSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: Stack(
        children: [
          WidgetSize(
            child: Image.asset(widget.image),
            onChange: (size) {
              setState(() {
                headerSize = size;
              });
            },
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.title,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: (headerSize?.height ?? 0) - 28,
            height: MediaQuery.of(context).size.height - (headerSize?.height ?? 0) + 28,
            width: MediaQuery.of(context).size.width,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
