part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.loading() = _Loading;
  const factory CheckoutState.loaded(
      {required List<ProductsQuantityModel> productsCheckout}) = _Loaded;
  const factory CheckoutState.error({required String message}) = _Error;
}
