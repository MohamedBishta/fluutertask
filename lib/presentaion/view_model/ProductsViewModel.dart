import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product_entity/ProductEntity.dart';
import '../../domain/usecase/product_use_case.dart';
@injectable
class ProductsViewModel extends Cubit<ProductsState>{
  ProductsUseCase productsUseCase;
  @factoryMethod
  ProductsViewModel(this.productsUseCase):super(ProductsInitialState());
  static ProductsViewModel get(context)=> BlocProvider.of(context);
  getProducts() async{
    emit(ProductsLoadingState());
   var result = await productsUseCase.call();
   result.fold((products){
     emit(ProductsSuccessState(products));
   }, (error){
     emit(ProductsErrorState(error));
   });
  }
}

abstract class ProductsState{}
class ProductsInitialState extends ProductsState{}

class ProductsLoadingState extends ProductsState{}
class ProductsErrorState extends ProductsState{
  String error;
  ProductsErrorState(this.error);
}
class ProductsSuccessState extends ProductsState{
  List<ProductEntity> products;
  ProductsSuccessState(this.products);
}