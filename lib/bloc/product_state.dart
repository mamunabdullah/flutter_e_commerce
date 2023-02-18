part of 'product_bloc.dart';

class ProductState extends Equatable {
  final HomeStatus status;
  final List<Results> productList;
  final String errorMsg;
  final ProductDetailsResponse? productDetails;

  const ProductState(
      {this.status = HomeStatus.initial,
      this.productList = const <Results>[],
      this.errorMsg = "",
      this.productDetails});

  ProductState copyWith({
    required HomeStatus status,
    final List<Results>? productList,
    final String? errorMsg,
    final ProductDetailsResponse? productDetails,
  }) {
    return ProductState(
        status: status,
        productList: productList ?? this.productList,
        errorMsg: errorMsg ?? this.errorMsg,
        productDetails: productDetails ?? this.productDetails);
  }

  @override
  List<Object?> get props => [status, productList, errorMsg,productDetails];
}

enum HomeStatus {
  initial,
  loading,
  productListFetched,
  error,
  productDetailsFetched
}
