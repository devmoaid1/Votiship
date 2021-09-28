part of 'president_bloc.dart';

abstract class PresidentEvent extends Equatable {
  const PresidentEvent();

  @override
  List<Object> get props => [];
}

class GetAllPresident extends PresidentEvent {}

class VotePresident extends PresidentEvent {
  String id;

  int votes;
  VotePresident({this.id, this.votes});
}

class AddPresident extends PresidentEvent {
  President newPresident;
  AddPresident({this.newPresident});
}

class SetPresident extends PresidentEvent {
  String id;
  SetPresident({this.id});
}

class GetPresident extends PresidentEvent {
  String id;
  GetPresident({this.id});
}

class DeletePresident extends PresidentEvent {
  String id;
  DeletePresident({this.id});
}
