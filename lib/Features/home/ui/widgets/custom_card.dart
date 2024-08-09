import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Features/cart/cubit/cubit/cart_cubit.dart';
import 'package:store/Features/cart/data/model/cart_model.dart';
import 'package:store/Features/home/data/model/product_model.dart';

class CustomCard extends StatefulWidget {
  final ProductModel product;

  const CustomCard({
    super.key,
    required this.product,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  int quantity = 0; // Start quantity at 0

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }
void _addToCart() {
  if (quantity > 0) {
    final cartItem = Cart(
      id: 1, // Assuming userId is 1
      date: DateTime.now().toIso8601String(),
      products: [
        Products(productId: widget.product.id!, quantity: quantity),
      ],
      iV: null,
    );

    BlocProvider.of<CartCubit>(context).addCart(cartItem);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Quantity must be greater than 0'),
        backgroundColor: Colors.red,
      ),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200.h,
          width: 250.w,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 40.r,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: const Offset(10, 10),
              ),
            ],
          ),
          child: Card(
            color: Colors.white,
            elevation: 19,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      widget.product.title ?? 'No Title',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '\$${widget.product.price?.toStringAsFixed(2) ?? '0.00'}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: _decreaseQuantity,
                            tooltip: 'Decrease quantity',
                          ),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: _increaseQuantity,
                            tooltip: 'Increase quantity',
                          ),
                        ],
                      ),
                      SizedBox(
                          width: 50.w, // Set width for the button
                          child: IconButton(
                            onPressed: _addToCart,
                            icon: const Icon(
                              FontAwesomeIcons.cartShopping,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 16,
          bottom: 80, // Adjusted position
          height: 100,
          width: 100,
          child: ClipRect(
  child: widget.product.image?.isNotEmpty ?? false
      ? FadeInImage.assetNetwork(
          placeholder: 'assets/images/load.gif',
          image: widget.product.image!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        )
      : Image.asset('assets/images/load.gif'),
),

        ),
      ],
    );
  }
}
