import 'package:dartz/dartz.dart';
import 'package:product_screen/domain/entities/product_entity/ProductEntity.dart';

abstract class ProductsRepo{
  Future<Either<List<ProductEntity>,String>> getProducts();
}