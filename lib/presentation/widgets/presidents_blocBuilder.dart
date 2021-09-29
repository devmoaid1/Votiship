import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:votiship/buisness%20Logic/bloc/bloc/president_bloc.dart';
import 'package:votiship/data/models/president.dart';

import '../../routes_constants.dart';
import 'Presidents_Container.dart';

Widget buildPresidentsBloc(PresidentBloc bloc) {
  return BlocConsumer<PresidentBloc, PresidentState>(
    listener: (context, state) {
      if (state is VotedState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('voted!'),
            duration: Duration(seconds: 1),
          ),
        );
      } else if (state is AddPresident) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('created'),
            duration: Duration(seconds: 1),
          ),
        );
      } else if (state is DeletePresident) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('deleted'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    },
    builder: (context, state) {
      if (state is Loading) {
        return CircularProgressIndicator();
      } else if (state is PresidentsList) {
        var presidents = state.presidents;
        return Container(
          color: Colors.black,
          child: buildPresidentsList(presidents, bloc),
        );
      } else if (state is ErrorMassage) {
        return ErrorWidget(state.massage.toString());
      }
      return Container();
    },
  );
}

Widget buildPresidentsList(List<President> presidents, PresidentBloc bloc) {
  return ListView.separated(
    itemCount: presidents.length,
    separatorBuilder: (context, index) => Divider(
      color: Colors.blueGrey,
    ),
    itemBuilder: (context, index) {
      final onTap = () => {
            bloc.add(VotePresident(
                id: presidents[index].id, votes: presidents[index].votes + 1))
          };

      final onLongPress = () => {
            bloc.add(DeletePresident(id: presidents[index].id)),
            print("pressed")
          };

      final readMore = () => {
            bloc.add(SetPresident(id: presidents[index].id)),
            Navigator.pushNamed(context, detailsScreenRoute),
            print("Navigated")
          };

      return PresidentContainer(
        president: presidents[index],
        handleTap: onTap,
        handleOnLongPressed: onLongPress,
        handleReadMore: readMore,
      );
    },
  );
}
