import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/product/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState.initial()) {
    on<GetProductEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        final service = await ProductService.getAll(event.search);

        emit(state.copyWith(status: Status.success, products: service));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });

    on<CreateProductEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        await ProductService.create(event.product);

        emit(state.copyWith(status: Status.apply));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });

    on<UpdateProductEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        await ProductService.update(event.product);

        emit(state.copyWith(status: Status.apply));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });

    on<DeleteProductEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        await ProductService.delete(event.id);

        emit(state.copyWith(status: Status.deleted));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });
  }
}
