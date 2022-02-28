import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/modules/home/model/model/city/city_model.dart';
import 'package:most5dm/modules/home/model/model/products/product_model.dart';
import 'package:most5dm/modules/home/model/service/city/city_services.dart';
import 'package:most5dm/modules/home/model/service/products/products_services.dart';
import 'package:most5dm/utils/utils.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  bool _showSuggestions = true;
  List<CityModel> _cities = [];
  SearchCubit() : super(InitialSearchState());

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  searchProducts({required String text}) async{
    emit(SearchLoadingState());
    _showSuggestions = false;
    ProductsService().getProductsBySearch(text).then((value) async{
      print('RESULT $value');
      for(var product in value){
        List list = await CityServices().getCityByCityId(product.cityId as int);
        _cities.add(list.first);
      }
      emit(SearchSuccessState(value));
    }).catchError((onError) {
      emit(SearchErrorState());
      DebugPrint('Error: $onError');
    });
  }

  bool get showSuggestions => _showSuggestions;
  List<CityModel>  get cities => _cities;
}
