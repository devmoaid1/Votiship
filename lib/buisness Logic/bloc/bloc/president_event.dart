part of 'president_bloc.dart';

abstract class PresidentEvent extends Equatable {
  const PresidentEvent();

  @override
  List<Object> get props => [];
}

class GetPreseidents extends PresidentEvent {}
