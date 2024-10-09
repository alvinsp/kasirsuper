part of 'form_product_bloc.dart';

class FormProductState extends Equatable {
  const FormProductState({
    this.description,
    this.error,
    this.image,
    this.name,
    this.priceItem,
    this.priceRegular,
    this.sku,
    this.status = Status.initial,
    this.stock,
    this.unit,
  });

  factory FormProductState.initial() {
    return const FormProductState();
  }

  final Status status;
  final String? error;
  final String? name;
  final String? description;
  final String? image;
  final int? priceRegular;
  final String? unit;
  final int? priceItem;
  final int? stock;
  final String? sku;

  ProductModel product({int? id, DateTime? createdAt}) {
    return ProductModel(
      id: id ?? 0,
      title: name ?? '',
      desc: description ?? '',
      image: image ?? '',
      regularPrice: priceRegular ?? 0,
      price: priceItem ?? 0,
      stock: stock ?? 0,
      unit: unit ?? '',
      sku: sku ?? '',
      createdAt: createdAt ?? DateTime.now(),
    );
  }

  num get margin {
    return ((priceRegular ?? 0) - (priceItem ?? 0)) / (priceRegular ?? 0) * 100;
  }

  num get profit {
    return (priceRegular ?? 0) - (priceItem ?? 0);
  }

  bool get isValid =>
      name != null &&
      name!.isNotEmpty &&
      description != null &&
      description!.isNotEmpty &&
      priceRegular != null &&
      (priceRegular ?? 0) > 0 &&
      unit != null &&
      unit!.isNotEmpty;

  FormProductState copyWith({
    Status? status,
    String? error,
    String? name,
    String? description,
    String? image,
    int? priceRegular,
    String? unit,
    int? priceItem,
    int? stock,
    String? sku,
  }) {
    return FormProductState(
      description: description ?? this.description,
      error: error,
      image: image ?? this.image,
      name: name ?? this.name,
      priceItem: priceItem ?? this.priceItem,
      priceRegular: priceRegular ?? this.priceRegular,
      status: status ?? this.status,
      stock: stock ?? this.stock,
      sku: sku ?? this.sku,
      unit: unit ?? this.unit,
    );
  }

  @override
  List<Object?> get props => [
        description,
        error,
        image,
        name,
        priceItem,
        priceRegular,
        sku,
        status,
        stock,
        unit,
      ];
}
