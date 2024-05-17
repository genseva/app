import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddItemButton extends StatefulWidget {
  AddItemButton({super.key, required this.quantity});

  int quantity;

  @override
  State<AddItemButton> createState() => _AddItemButtonState();
}

class _AddItemButtonState extends State<AddItemButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.quantity == 0) {
          widget.quantity++;
        }
        setState(() {});
      },
      child: Container(
        height: 32,
        width: MediaQuery.of(context).size.width * 0.22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Theme.of(context).primaryColor),
          color: widget.quantity == 0
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.quantity > 0) ...[
              GestureDetector(
                onTap: () {
                  widget.quantity--;
                  setState(() {});
                },
                child: const Icon(
                  Icons.remove,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Text(
                  widget.quantity.toString(),
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.quantity++;
                  setState(() {});
                },
                child: const Icon(Icons.add, size: 16, color: Colors.white),
              ),
            ] else
              Text(
                "Add",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
          ],
        ),
      ),
    );
  }
}
