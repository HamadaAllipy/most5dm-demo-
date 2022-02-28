part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class InitialProductState extends ProductState {}
class ToggleVisiblePhoneNumber extends ProductState {}
class ProductDetailsLoadingState extends ProductState {}
class ProductDetailsSuccessState extends ProductState {}
class ProductDetailsErrorState extends ProductState {}
