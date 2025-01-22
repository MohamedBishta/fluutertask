
import '../../../data/model/products_response/ProductsModel.dart';


abstract class ProductsRepo{
  Future<List<ProductsModel>> getProducts();
}