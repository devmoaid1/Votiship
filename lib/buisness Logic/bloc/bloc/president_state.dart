part of 'president_bloc.dart';

abstract class PresidentState extends Equatable {
  const PresidentState();

  @override
  List<Object> get props => [];
}

class PresidentInitial extends PresidentState {}

class Loading extends PresidentState {}

class PresidentsList extends PresidentState {
  List<President> presidents;
  PresidentsList({this.presidents});
}

class VotedState extends PresidentState {
  President votedPresident;
  VotedState({this.votedPresident});
}

class PresidentDetails extends PresidentState {
  President singlePresident;
  PresidentDetails({this.singlePresident});
}

class ErrorMassage extends PresidentState {
  String massage;
  ErrorMassage({this.massage});
}

class PresidentId extends PresidentState {
  String id;
  PresidentId({this.id});
}

class AddedPresident extends PresidentState {
  President addedPresident;
  AddedPresident({this.addedPresident});
}

class DeletedPresident extends PresidentState {
  String id;
  DeletedPresident({this.id});
}
