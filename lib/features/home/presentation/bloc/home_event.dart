part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SelectCity extends HomeEvent {
  final String city;
  const SelectCity(this.city);
}
