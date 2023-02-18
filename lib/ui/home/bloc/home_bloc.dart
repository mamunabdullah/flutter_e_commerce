import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/models/product_list_item_response.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repository/product_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository _repository;

  HomeBloc({required ProductRepository repository})
      : _repository = repository,
        super(const HomeState()) {
    on<SearchProductsEvent>(_searchProducts);
  }

  FutureOr<void> _searchProducts(
      SearchProductsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));

    var response = await _repository.searchProducts(search: event.searchQuery);

    try {
      if (response != null && response.status == "success") {
        List<Results>? productList = response.data?.products?.results;
        if (productList != null && productList.isNotEmpty) {
          emit(state.copyWith(
              status: HomeStatus.success, productList: productList));
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
}
