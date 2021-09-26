part of 'president_bloc.dart';

abstract class PresidentState extends Equatable {
  const PresidentState();
  
  @override
  List<Object> get props => [];
}

class PresidentInitial extends PresidentState {}
