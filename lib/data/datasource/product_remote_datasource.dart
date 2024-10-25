import 'package:biis_seleksi_app/data/models/response/products_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class ProductRemoteDatasource {
  Future<Either<String, ProductsResponse>> getAllProducts() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/products'));

    if (response.statusCode == 200) {
      return Right(ProductsResponse.fromJson(response.body));
    } else {
      return Left('Failed to fetch products');
    }
  }
}
