import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/components/widget_size.dart';
import 'package:deligo/generated/assets.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    super.key,
    required this.image,
    required this.title,
    required this.child,
  });

  final String image;
  final String title;
  final Widget child;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  Size? headerSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
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
            top: (headerSize?.height ?? 0) - 20,
            width: MediaQuery.of(context).size.width,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
