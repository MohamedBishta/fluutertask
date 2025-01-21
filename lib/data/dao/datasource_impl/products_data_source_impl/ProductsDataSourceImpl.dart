import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/api/endpoints.dart';
import '../../../model/products_response/ProductsResponse.dart';
import '../../datasource_contract/products_datasource/ProductsDataSource.dart';
@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl extends ProductsDataSource{
  ApiManager apiManager;
  @factoryMethod
  ProductsDataSourceImpl(this.apiManager);
  @override
  Future<Either<ProductsResponse, String>> getProducts() async {
    try{
      var response = await apiManager.getRequest(endpoint: Endpoints.productsEndpoint);
      return Left(ProductsResponse.fromJson(response.data));
    }catch(error){
      return Right(error.toString());
    }
  }

}