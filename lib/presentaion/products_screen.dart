import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_screen/presentaion/view_model/ProductsViewModel.dart';
import 'package:product_screen/presentaion/view_model/widgets/product_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ProductsViewModel.get(context).getProducts();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsViewModel,ProductsState>(
          buildWhen: (previous, current) {
        if(current is ProductsLoadingState || current is ProductsErrorState || current is ProductsSuccessState){
        return true ;
        }
        return false;
        },
          builder: (BuildContext context, ProductsState state) {
            if(state is ProductsSuccessState){
              return Padding(
                padding:  REdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      childAspectRatio: 0.8,
                  mainAxisSpacing: 10.sp,
                  crossAxisSpacing: 10.sp),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => ProductWidget(productModel: state.products[index])),
              );
            }
            if(state is ProductsErrorState){
              return Center(child: Text(state.error),);
            }
            return Center(child: CircularProgressIndicator(),);
          },
      ),
    );
  }
}
