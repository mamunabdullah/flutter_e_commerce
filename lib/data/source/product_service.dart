import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_commerce/domain/models/product_list_item_response.dart';
import 'package:e_commerce/utils/constants.dart';

import '../../domain/models/Product_details_response.dart';

class ProductService {
  Future<ProductListItemResponse?> searchProducts(
      {String search = "", int limit = 100, int offset = 10}) async {
    final Uri productSearchUri = Uri.parse(
        "${kBaseUrl}product/search-suggestions/?limit=$limit&offset=$offset&search=$search");

    try {
      final response = await http.get(productSearchUri);
      if (response.statusCode == 200) {
        print('ProductService.searchProducts: success: ${response.body}');
        return ProductListItemResponse.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        print(
            'ProductService.searchProducts: statusCode: ${response.statusCode}');
        return null;
      }
    } on Exception catch (e) {
      print('ProductService.searchProducts error: $e}');
      return null;
    } catch (e) {
      print('ProductService.searchProducts error: $e}');
      return null;
    }
  }

  Future<ProductDetailsResponse?> fetchProductDetails(
      {required String slug}) async {
    final Uri uri = Uri.parse("${kBaseUrl}product-details/$slug/");

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        print('ProductService.fetchProductDetails: success: ${response.body}');
        return ProductDetailsResponse.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        print(
            'ProductService.searchProducts: statusCode: ${response.statusCode}');
        return null;
      }
    } on Exception catch (e) {
      print('ProductService.fetchProductDetails error: $e}');
      return null;
    } catch (e) {
      print('ProductService.fetchProductDetails error: $e}');
      return null;
    }
  }
}
