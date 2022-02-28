part of 'search_cubit.dart';

@immutable
abstract class SearchStates {}

class InitialSearchState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  final List<ProductModel> searchProducts;

  SearchSuccessState(this.searchProducts);
}

class SearchErrorState extends SearchStates {}
