import 'dart:convert';

import '../../../data/models/response/products_response_model.dart';

class ProductsQuantityModel {
  Product product;
  int quantity;

  ProductsQuantityModel(
    this.product,
    this.quantity,
  );

  ProductsQuantityModel copyWith({
    Product? product,
    int? quantity,
  }) {
    return ProductsQuantityModel(
      product ?? this.product,
      quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(covariant ProductsQuantityModel other) {
    if (identical(this, other)) return true;

    return other.product == product && other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory ProductsQuantityModel.fromMap(Map<String, dynamic> map) {
    return ProductsQuantityModel(
      Product.fromMap(map['product'] as Map<String, dynamic>),
      map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsQuantityModel.fromJson(String source) =>
      ProductsQuantityModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductQuantityModel(product: $product, quantity: $quantity)';
}
