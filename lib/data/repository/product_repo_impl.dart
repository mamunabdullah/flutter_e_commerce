import 'package:e_commerce/domain/models/Product_details_response.dart';
import 'package:e_commerce/domain/models/product_list_item_response.dart';
import 'package:e_commerce/domain/repository/product_repository.dart';
import 'package:e_commerce/data/source/product_service.dart';

class ProductRepoImpl extends ProductRepository {
  final ProductService productService;

  ProductRepoImpl(this.productService);

  @override
  Future<ProductListItemResponse?> searchProducts(
      {String search = "", int limit = 10, int offset = 10}) {
    return productService.searchProducts(
        search: search, limit: limit, offset: offset);
  }

  @override
  Future<ProductDetailsResponse?> fetchProductDetails({required String slug}) {
    return productService.fetchProductDetails(slug: slug);
  }
}
