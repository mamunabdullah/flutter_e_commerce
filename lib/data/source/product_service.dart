import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_commerce/domain/models/product_list_item_response.dart';
import 'package:e_commerce/utils/constants.dart';

class ProductService {
  Future<ProductListItemResponse?> searchProducts(
      {String search = "", int limit = 10, int offset = 10}) async {
    final Uri productSearchUri = Uri.parse(
        "${kBaseUrl}search-suggestions/?limit=$limit&offset=$offset&search=$search");

    try {
      final response = await http.get(productSearchUri);
      if (response.statusCode == 200) {
        print('ProductService.searchProducts: success: ${response.body}');
        return ProductListItemResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
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
}
