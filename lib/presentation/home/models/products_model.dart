import 'package:biis_seleksi_app/core/extensions/int_ext.dart';

class ProductsModel {
  final List<String> images;
  final String name;
  final int price;
  final int stock;
  final String description;

  ProductsModel({
    required this.images,
    required this.name,
    required this.price,
    required this.stock,
    required this.description,
  });

  String get priceFormat => price.currencyFormatRp;
}
