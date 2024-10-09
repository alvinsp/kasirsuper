part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductEvent extends ProductEvent {
  final String search;

  const GetProductEvent(this.search);

  @override
  List<Object> get props => [search];
}

class CreateProductEvent extends ProductEvent {
  final ProductModel product;

  const CreateProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

class UpdateProductEvent extends ProductEvent {
  final ProductModel product;

  const UpdateProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

class DeleteProductEvent extends ProductEvent {
  final int id;

  const DeleteProductEvent(this.id);

  @override
  List<Object> get props => [id];
}
