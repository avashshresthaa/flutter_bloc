import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/cubit/app_cubit_states.dart';
import 'package:flutter_bloc_practice/model/data_model.dart';
import 'package:flutter_bloc_practice/services/data_services.dart';

//Cubit kknows if we have staes by using CubitStates
class AppCubits extends Cubit<CubitStates> {
  //We need to call our initialstate then we want to emit a new state to show the welcome page
  AppCubits({required this.data}) : super(InitialState()) {
    //we will trigger welcomestate using emit
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;

//To call the states we create a new method
  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
