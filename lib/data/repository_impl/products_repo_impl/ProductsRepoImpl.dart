import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:product_screen/data/dao/datasource_contract/products_datasource/ProductsDataSource.dart';
import 'package:product_screen/domain/entities/product_entity/ProductEntity.dart';
import 'package:product_screen/domain/repository_contract/products_repo/ProductsRepo.dart';

import '../../model/products_response/ProductsMode.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo{
  ProductsDataSource apiDataSource;
  @factoryMethod
  ProductsRepoImpl(this.apiDataSource);
  @override
  Future<Either<List<ProductEntity>, String>> getProducts() async {
    var result = await apiDataSource.getProducts();
    return result.fold((response){
      List<ProductsModel> productsModelList = response.products??[];
      List<ProductEntity> productEntityList = productsModelList.map((productModel) => productModel.toProductEntity()).toList();
      return Left(productEntityList);
    }, (error){
      return Right(error);
    });
  }

}