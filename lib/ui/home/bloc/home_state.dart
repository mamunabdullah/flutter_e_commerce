part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeStatus status;
  final List<Results> productList;
  final String errorMsg;

  const HomeState({
    this.status = HomeStatus.initial,
    this.productList = const <Results>[],
    this.errorMsg = "",
  });

  HomeState copyWith({
    required HomeStatus status,
    final List<Results>? productList,
    final String? errorMsg,
  }) {
    return HomeState(
        status: status,
        productList: productList ?? this.productList,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  List<Object?> get props => [status, productList, errorMsg];
}

enum HomeStatus { initial, loading, success, error }
