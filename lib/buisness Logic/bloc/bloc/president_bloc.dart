import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'president_event.dart';
part 'president_state.dart';

class PresidentBloc extends Bloc<PresidentEvent, PresidentState> {
  PresidentBloc() : super(PresidentInitial());

  Stream<PresidentState> mapEventToState(PresidentEvent event) async* {}
}
