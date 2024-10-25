import 'package:biis_seleksi_app/data/models/response/products_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/products_quantity_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const _Loaded(productsCheckout: [])) {
    on<_AddProductToCart>((event, emit) {
      final currentState = state as _Loaded;
      if (currentState.productsCheckout
          .any((element) => element.product.id == event.product.id)) {
        final index = currentState.productsCheckout
            .indexWhere((element) => element.product.id == event.product.id);
        final newProduct = currentState.productsCheckout[index].copyWith(
            quantity: currentState.productsCheckout[index].quantity + 1);
        final newProducts = currentState.productsCheckout
            .map((e) => e.product.id == event.product.id ? newProduct : e)
            .toList();
        emit(_Loaded(productsCheckout: newProducts));
      } else {
        final newProducts = ProductsQuantityModel(event.product, 1);
        emit(_Loaded(
            productsCheckout: [...currentState.productsCheckout, newProducts]));
      }
    });

    on<_RemoveProductFromCart>((event, emit) {
      final currentState = state as _Loaded;
      if (currentState.productsCheckout
          .any((element) => element.product.id == event.product.id)) {
        final index = currentState.productsCheckout
            .indexWhere((element) => element.product.id == event.product.id);
        if (currentState.productsCheckout[index].quantity > 1) {
          final newProduct = currentState.productsCheckout[index].copyWith(
              quantity: currentState.productsCheckout[index].quantity - 1);
          final newProducts = currentState.productsCheckout
              .map((e) => e.product.id == event.product.id ? newProduct : e)
              .toList();
          emit(_Loaded(productsCheckout: newProducts));
        } else {
          final newProducts = currentState.productsCheckout
              .where((element) => element.product.id != event.product.id)
              .toList();
          emit(_Loaded(productsCheckout: newProducts));
        }
      }
    });
  }
}
