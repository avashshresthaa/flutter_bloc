import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practice/model/data_model.dart';

//
abstract class CubitStates extends Equatable {}

//Every Cubit App should have one initial state when we first create cubit we should pass a state class or a state function
//For every cubit app we need to inital this and once it is done we should trigger Welcome state
class InitialState extends CubitStates {
  @override
  // TODO: implement props

  // We put the data that should be changed , states should hold data
  List<Object> get props => [];
}

//This state will be responsible for showing Welcome Page once the initialize has been done
class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

//This state will be triggred when we are trying to load the data
class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

//This state will trigger when the data has been loaded sucessfully
class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  // TODO: implement props

  //it used to to trigger auto build ui
  //so cubit will know we need to rebuild the data
  List<Object> get props => [places];
}

class DetailState extends CubitStates {
  DetailState(this.places);
  final DataModel places;
  @override
  // TODO: implement props

  //it used to to trigger auto build ui
  //so cubit will know we need to rebuild the data
  List<Object> get props => [places];
}
