part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = _Started;
  const factory CheckoutEvent.addProductToCart({required Product product}) =
      _AddProductToCart;
  const factory CheckoutEvent.removeProductFromCart(
      {required Product product}) = _RemoveProductFromCart;
}
