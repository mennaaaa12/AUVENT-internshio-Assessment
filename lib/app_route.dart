import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Features/auth/cubit/cubit/auth_cubit.dart';
import 'package:store/Features/auth/data/repository/auth_repo.dart';
import 'package:store/Features/auth/data/web_services/auth_web_services.dart';
import 'package:store/Features/auth/ui/login.dart';
import 'package:store/Features/cart/cubit/cubit/cart_cubit.dart';
import 'package:store/Features/cart/data/repo/cart_repository.dart';
import 'package:store/Features/cart/data/web_services/cart_web_services.dart';
import 'package:store/Features/cart/ui/cart.dart';
import 'package:store/Features/home/ui/home_page.dart';
import 'package:store/Features/home/cubit/product_cubit.dart';
import 'package:store/Features/home/data/repository/product_repository.dart';
import 'package:store/Features/home/data/web_service/product_web_services.dart';
import 'package:store/core/constant/strings.dart';

class AppRouter {
  final ProductRepository productRepository;
  final ProductCubit productCubit;
  final AuthRepository authRepository;
  final AuthCubit authCubit;
  final CartRepository cartRepository; 
  final CartCubit cartCubit; 

  AppRouter({
    required this.productCubit,
    required this.authCubit,
    required this.cartCubit, 
  })  : productRepository = ProductRepository(ProductWebServices(baseUrl: baseUrl)),
        authRepository = AuthRepository(AuthWebServices(baseUrl: baseUrl)),
        cartRepository = CartRepository(CartWebServices(baseUrl: baseUrl));

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case productScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => productCubit),
              BlocProvider(create: (context) => cartCubit), 
            ],
            child: const HomePage(),
          ),
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => authCubit,
            child: const LoginPage(),
          ),
        );

      case cartPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => cartCubit,
            child: const CartPage(),
          ),
        );

      default:
        return null;
    }
  }
}
