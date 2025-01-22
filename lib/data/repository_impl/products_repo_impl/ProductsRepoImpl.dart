import 'package:injectable/injectable.dart';
import 'package:product_screen/core/api/api_manager.dart';
import 'package:product_screen/core/api/endpoints.dart';
import 'package:product_screen/domain/repository_contract/products_repo/ProductsRepo.dart';

import '../../model/products_response/ProductsModel.dart';


@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo{
  ApiManager apiManager;
  @factoryMethod
  ProductsRepoImpl(this.apiManager);
  @override
  Future<List<ProductsModel>> getProducts() async {
      var result = await apiManager.getRequest(endpoint: Endpoints.productsEndpoint);
      return (result.data as List).map((e) => ProductsModel.fromJson(e)).toList();
  }

}