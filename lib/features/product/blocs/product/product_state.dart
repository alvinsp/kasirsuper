part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.error,
    this.products = const [],
    this.status = Status.initial,
  });

  factory ProductState.initial() {
    return const ProductState();
  }

  final Status status;
  final String? error;
  final List<ProductModel> products;

  ProductState copyWith({
    Status? status,
    String? error,
    List<ProductModel>? products,
  }) {
    return ProductState(
      error: error,
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [error, products, status];
}
