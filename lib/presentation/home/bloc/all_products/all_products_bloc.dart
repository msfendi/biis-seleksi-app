import 'package:biis_seleksi_app/data/datasource/product_remote_datasource.dart';
import 'package:biis_seleksi_app/data/models/response/products_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_products_event.dart';
part 'all_products_state.dart';
part 'all_products_bloc.freezed.dart';

class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  final ProductRemoteDatasource productRemoteDatasource;
  AllProductsBloc(this.productRemoteDatasource) : super(_Initial()) {
    on<_GetAllProducts>((event, emit) async {
      emit(_Loading());
      final result = await productRemoteDatasource.getAllProducts();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data!)),
      );
    });
  }
}
