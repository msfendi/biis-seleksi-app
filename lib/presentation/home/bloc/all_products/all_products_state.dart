part of 'all_products_bloc.dart';

@freezed
class AllProductsState with _$AllProductsState {
  const factory AllProductsState.initial() = _Initial;
  const factory AllProductsState.loading() = _Loading;
  const factory AllProductsState.loaded(List<Product> products) = _Loaded;
  const factory AllProductsState.error(String message) = _Error;
}
