import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:votiship/data/Presidents_service.dart';
import 'package:votiship/data/models/president.dart';

part 'president_event.dart';
part 'president_state.dart';

class PresidentBloc extends Bloc<PresidentEvent, PresidentState> {
  PresidentDataService presidentsService;
  PresidentBloc({this.presidentsService}) : super(PresidentInitial());

  Stream<PresidentState> mapEventToState(PresidentEvent event) async* {
    if (event is GetAllPresident) {
      yield Loading();
      try {
        var list = await presidentsService.getAllPresidents();

        yield PresidentsList(presidents: list);
      } catch (err) {
        yield ErrorMassage(massage: err.toString());
      }
    } else if (event is AddPresident) {
      final president = event.newPresident;
      try {
        var addedPresident =
            await presidentsService.addPresident(president: president);
        yield Loading();

        var list = await presidentsService.getAllPresidents();
        yield AddedPresident(addedPresident: addedPresident);
        yield PresidentsList(presidents: list);
      } catch (err) {
        yield ErrorMassage(massage: err.toString());
        print(err.toString());
      }
    } else if (event is VotePresident) {
      final id = event.id;
      final votes = event.votes;
      try {
        var newPresident =
            await presidentsService.votePresident(id: id, vote: votes);

        var list = await presidentsService.getAllPresidents();

        yield VotedState(votedPresident: newPresident);
        yield PresidentDetails(singlePresident: newPresident);
        yield PresidentsList(presidents: list);
      } catch (err) {
        yield ErrorMassage(massage: err.toString());
      }
    } else if (event is GetPresident) {
      var id = event.id;
      yield Loading();
      try {
        print(id);
        var president = await presidentsService.getPresident(id: id);
        print(president);
        yield PresidentDetails(singlePresident: president);
      } catch (err) {
        yield ErrorMassage(massage: err.toString());
      }
    } else if (event is SetPresident) {
      final id = event.id;
      try {
        yield PresidentId(id: id);
      } catch (err) {
        yield ErrorMassage(massage: err.toString());
      }
    } else if (event is DeletePresident) {
      try {
        final id = event.id;
        await presidentsService.deletePresident(id: id);
        yield Loading();
        var list = await presidentsService.getAllPresidents();
        yield PresidentsList(presidents: list);
      } catch (err) {}
    }
  }
}
