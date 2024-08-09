import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Features/cart/cubit/cubit/cart_cubit.dart';
import 'package:store/Features/cart/cubit/cubit/cart_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartCubit>(context).getCart(5); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cart updated successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is CartError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${state.message}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
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
          } else if (state is CartInitial || state is CartSuccess) {
            return const Center(
              child: CircularProgressIndicator(),
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
