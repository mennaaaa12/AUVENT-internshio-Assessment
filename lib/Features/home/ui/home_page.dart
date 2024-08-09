import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/Features/cart/cubit/cubit/cart_cubit.dart';
import 'package:store/Features/cart/ui/cart.dart';
import 'package:store/Features/home/cubit/product_cubit.dart';
import 'package:store/Features/home/data/model/product_model.dart';
import 'package:store/Features/home/ui/widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ProductModel> allProducts;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductCubit>(context).getAllProducts();
    BlocProvider.of<CartCubit>(context).getCart(1); // Assume userId is 1 for demo
  }

  void _navigateToCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _navigateToCartPage,
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'App Store',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            allProducts = state.product;

            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
              child: GridView.builder(
                itemCount: allProducts.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 40,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(product: allProducts[index]);
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            );
          }
        },
      ),
    );
  }
}
