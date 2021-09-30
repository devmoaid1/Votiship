import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:votiship/buisness%20Logic/bloc/bloc/president_bloc.dart';
import 'package:votiship/data/models/president.dart';
import 'package:votiship/presentation/widgets/president_details_widget.dart';
import 'package:votiship/routes_constants.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen() : super();

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  PresidentBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<PresidentBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<PresidentBloc, PresidentState>(
      listener: (context, state) {
        if (state is PresidentId) {
          final presidentId = state.id;
          bloc.add(GetPresident(id: presidentId));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('state is Get president'),
              duration: Duration(seconds: 1),
            ),
          );
        }

        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is PresidentId) {
          bloc.add(GetPresident(id: state.id));
          return Center(child: Text(state.id));
        } else if (state is PresidentDetails) {
          final president = state.singlePresident;
          return buildPresidentDetails(context, president, bloc);
        } else if (state is ErrorMassage) {
          return Center(
              child: Text(
            state.massage,
            style: TextStyle(fontSize: 20),
          ));
        }
        return Container();
      },
    ));
  }
}
