import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Features/cart/cubit/cubit/cart_cubit.dart';
import 'package:store/Features/cart/cubit/cubit/cart_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            final cart = state.cart;
            return ListView.builder(
              itemCount: cart.products?.length ?? 0,
              itemBuilder: (context, index) {
                final product = cart.products![index];
                return ListTile(
                  title: Text('Product ID: ${product.productId}'),
                  subtitle: Text('Quantity: ${product.quantity}'),
                );
              },
            );
          } else if (state is CartError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
