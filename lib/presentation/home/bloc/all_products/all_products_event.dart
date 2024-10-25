part of 'all_products_bloc.dart';

@freezed
class AllProductsEvent with _$AllProductsEvent {
  const factory AllProductsEvent.started() = _Started;
  const factory AllProductsEvent.getAllProducts() = _GetAllProducts;
}
