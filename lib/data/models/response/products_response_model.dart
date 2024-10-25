import 'dart:convert';

class ProductsResponse {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<Product>? data;
  final Support? support;

  ProductsResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory ProductsResponse.fromJson(String str) =>
      ProductsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsResponse.fromMap(Map<String, dynamic> json) =>
      ProductsResponse(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromMap(x))),
        support:
            json["support"] == null ? null : Support.fromMap(json["support"]),
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "support": support?.toMap(),
      };
}

class Product {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  final String? pantoneValue;

  Product({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        year: json["year"],
        color: json["color"],
        pantoneValue: json["pantone_value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "year": year,
        "color": color,
        "pantone_value": pantoneValue,
      };
}

class Support {
  final String? url;
  final String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromJson(String str) => Support.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Support.fromMap(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "text": text,
      };
}
