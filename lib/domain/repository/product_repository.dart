import '../models/Product_details_response.dart';
import '../models/product_list_item_response.dart';

abstract class ProductRepository {

  Future<ProductListItemResponse?> searchProducts({String search = "", int limit = 10, int offset = 10,});

  Future<ProductDetailsResponse?> fetchProductDetails({required String slug});
}