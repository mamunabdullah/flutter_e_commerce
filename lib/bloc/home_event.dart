part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class SearchProductsEvent extends HomeEvent {

  final String searchQuery;

  const SearchProductsEvent(this.searchQuery);

  @override
  List<Object?> get props => [searchQuery];

}
