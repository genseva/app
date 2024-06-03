import 'package:deligo/features/cart/cubit/cart_cubit.dart';
import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItemButton extends StatefulWidget {
  const AddItemButton({super.key,required this.store, required this.product});

  final StoreDomain store;
  final ProductDomain product;

  @override
  State<AddItemButton> createState() => _AddItemButtonState();
}

class _AddItemButtonState extends State<AddItemButton> {
  ProductDomain get product => widget.product;

  late final CartCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<CartCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (product.quantity == 0) {
          product.quantity++;
        }
        setState(() {});
        _cubit.updateFood(widget.store, product);
      },
      child: Container(
        height: 32,
        width: MediaQuery.of(context).size.width * 0.22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Theme.of(context).primaryColor),
          color: product.quantity == 0
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (product.quantity > 0) ...[
              GestureDetector(
                onTap: () {
                  product.quantity--;
                  setState(() {});
                  _cubit.updateFood(widget.store, product);
                },
                child: const Icon(
                  Icons.remove,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Text(
                  product.quantity.toString(),
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () {
                  product.quantity++;
                  setState(() {});
                  _cubit.updateFood(widget.store, product);
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
