import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Features/auth/data/repository/auth_repo.dart';
import 'package:store/Features/cart/cubit/cubit/cart_cubit.dart';
import 'package:store/Features/cart/data/repo/cart_repository.dart';
import 'package:store/Features/cart/data/web_services/cart_web_services.dart';
import 'package:store/app_route.dart';
import 'package:store/Features/auth/cubit/cubit/auth_cubit.dart';
import 'package:store/Features/auth/data/web_services/auth_web_services.dart';
import 'package:store/Features/home/cubit/product_cubit.dart';
import 'package:store/Features/home/data/repository/product_repository.dart';
import 'package:store/Features/home/data/web_service/product_web_services.dart';
import 'package:store/constant/strings.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  StoreApp({super.key});

  final AppRouter appRouter = AppRouter(
    productCubit: ProductCubit(
      productRepository: ProductRepository(ProductWebServices(baseUrl: baseUrl)),
    ),
    authCubit: AuthCubit(
      authRepository: AuthRepository(AuthWebServices(baseUrl: baseUrl)),
    ), cartCubit: CartCubit(cartRepository: CartRepository(CartWebServices(baseUrl: baseUrl))),
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => appRouter.productCubit,
            ),
            BlocProvider(
              create: (_) => appRouter.authCubit,
            ),
             BlocProvider(
              create: (_) => appRouter.cartCubit,
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
            initialRoute: loginScreen,  // Set the initial route
          ),
        );
      },
    );
  }
}
