part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class SearchProductsEvent extends ProductEvent {
  final String searchQuery;

  const SearchProductsEvent(this.searchQuery);

  @override
  List<Object?> get props => [searchQuery];
}

class FetchProductDetails extends ProductEvent {
  final String? slug;

  const FetchProductDetails(this.slug);

  @override
  List<Object?> get props => [slug];
}
