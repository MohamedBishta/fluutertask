import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:product_screen/domain/repository_contract/products_repo/ProductsRepo.dart';

import '../../data/model/products_response/ProductsModel.dart';

@injectable
class ProductsUseCase {
  ProductsRepo productsRepo;
  @factoryMethod
  ProductsUseCase(this.productsRepo);
  Future<Either<List<ProductsModel>,String>> call() async {
    try {
      final products = await productsRepo.getProducts();
      return Left(products);
    } catch (e) {
      return Right("Failed to fetch products: $e");
    }
  }
}