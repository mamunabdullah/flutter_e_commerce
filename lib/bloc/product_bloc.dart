import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/models/Product_details_response.dart';
import 'package:e_commerce/domain/models/product_list_item_response.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repository/product_repository.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;

  ProductBloc({required ProductRepository repository})
      : _repository = repository,
        super(const ProductState()) {
    on<SearchProductsEvent>(_searchProducts);
    on<FetchProductDetails>(_fetchProductDetails);
  }

  FutureOr<void> _searchProducts(
      SearchProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));

    var response = await _repository.searchProducts(search: event.searchQuery);

    try {
      if (response != null && response.status == "success") {
        List<Results>? productList = response.data?.products?.results;
        if (productList != null && productList.isNotEmpty) {
          emit(state.copyWith(
              status: HomeStatus.productListFetched, productList: productList));
        } else {
          emit(state.copyWith(
              status: HomeStatus.error, errorMsg: "No product Found"));
        }
      } else {
        emit(state.copyWith(
            status: HomeStatus.error,
            errorMsg: "Response not found! Please try again"));
      }
    } catch (e) {
      emit(state.copyWith(
          status: HomeStatus.error,
          errorMsg: "Something went wrong! please try again"));
      print(e);
    }
  }

  FutureOr<void> _fetchProductDetails(
      FetchProductDetails event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));

    print('ProductBloc._fetchProductDetails: Slug:  ${event.slug}');
    if (event.slug == null) {
      emit(state.copyWith(
          status: HomeStatus.error,
          errorMsg: "No Slug found for this product"));
    } else {
      var response = await _repository.fetchProductDetails(slug: event.slug!);
      try {
        if (response != null && response.status == "success") {
          emit(state.copyWith(
              status: HomeStatus.productDetailsFetched,
              productDetails: response));
        } else {
          emit(state.copyWith(
              status: HomeStatus.error,
              errorMsg: "Response not found! Please try again"));
        }
      } catch (e) {
        emit(state.copyWith(
            status: HomeStatus.error,
            errorMsg: "Something went wrong! please try again"));
        print(e);
      }
    }
  }
}
