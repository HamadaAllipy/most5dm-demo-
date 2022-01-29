import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most5dm/modules/home/model/model/product_model.dart';
import 'package:most5dm/modules/home/model/repository/home_repository.dart';
import 'package:most5dm/modules/home/model/service/home_service.dart';
import 'package:most5dm/modules/home/viewModel/home_states.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit(): super(InitialHomeState());


  static HomeCubit get(BuildContext context)=> BlocProvider.of(context);


  getData(HomeRepository homeRepository){
    print('hsdlfsdlkfjdslkfjdkslfj');
    Future<List<ProductModel>> products = homeRepository.getAllProducts();
     products.then((value){
       print(value[6].longDesc);
     }).catchError((onError){
       print('Error: $onError');
     });
  }
}