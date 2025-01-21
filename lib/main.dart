import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_screen/core/utils/routes_manager.dart';
import 'package:product_screen/presentaion/products_screen.dart';
import 'package:product_screen/presentaion/view_model/ProductsViewModel.dart';

import 'core/DI/di.dart';
import 'core/api/api_manager.dart';
import 'core/my_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  ApiManager.init();
  runApp(BlocProvider(
      create: (BuildContext context)=> getIt<ProductsViewModel>(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesManager.homeRouteName,
        routes: {
          RoutesManager.homeRouteName:(_)=> ProductsScreen(),
        },
      ),
    );
  }
}
