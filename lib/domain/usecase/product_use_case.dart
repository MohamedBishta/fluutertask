import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:product_screen/domain/repository_contract/products_repo/ProductsRepo.dart';

import '../entities/product_entity/ProductEntity.dart';
@injectable
class ProductsUseCase {
  ProductsRepo productsRepo;
  @factoryMethod
  ProductsUseCase(this.productsRepo);
  Future<Either<List<ProductEntity>, String>> call(){
    return productsRepo.getProducts();
  }
}