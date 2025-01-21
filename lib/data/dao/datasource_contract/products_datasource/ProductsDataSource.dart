import 'package:dartz/dartz.dart';

import '../../../model/products_response/ProductsResponse.dart';

abstract class ProductsDataSource{
  Future<Either<ProductsResponse,String>> getProducts();
}