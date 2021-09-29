import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:votiship/buisness%20Logic/bloc/bloc/president_bloc.dart';
import 'package:votiship/data/models/president.dart';
import 'package:votiship/presentation/widgets/Presidents_Container.dart';
import 'package:votiship/presentation/widgets/presidents_blocBuilder.dart';
import 'package:votiship/routes_constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen() : super();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PresidentBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<PresidentBloc>(context);
    bloc.add(GetAllPresident());
    print(bloc.toString());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Votiship",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: buildPresidentsBloc(bloc),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            flex: 1,
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                var president = President(
                    avatar:
                        "https://apex.aero/wp-content/uploads/2020/08/Calin-Rovinescu-new-image-1-e1534786641608.jpg",
                    description: "new description",
                    location: "Norway",
                    name: "Jossef Kareem",
                    votes: 0);
                bloc.add(AddPresident(newPresident: president));
              },
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            flex: 1,
            child: FloatingActionButton(
              child: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.pushNamed(context, detailsScreenRoute);
              },
            ),
          ),
        ],
      ),
    );
  }
}
