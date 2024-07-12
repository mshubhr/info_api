// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product_model.dart';

class ProductRepository {
  final String apiUrl = 'http://localhost:3000/products';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> productJson = json.decode(response.body);
      return productJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
