import '../models/Product_details_response.dart';
import '../models/product_list_item_response.dart';

abstract class ProductRepository {

  Future<ProductListItemResponse?> searchProducts({String search = ""});

  Future<ProductDetailsResponse?> fetchProductDetails({required String slug});
}