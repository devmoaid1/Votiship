import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:votiship/buisness%20Logic/bloc/bloc/president_bloc.dart';
import 'package:votiship/data/models/president.dart';
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
      body: BlocConsumer<PresidentBloc, PresidentState>(
        listener: (context, state) {
          if (state is VotedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('voted!'),
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
              child: ListView.separated(
                itemCount: presidents.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.blueGrey,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      color: Color(0xff1E1C1C),
                      child: ListTile(
                        focusColor: Colors.grey[100],
                        onTap: () {
                          bloc.add(VotePresident(
                              id: presidents[index].id,
                              votes: presidents[index].votes + 1));
                        },
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(presidents[index].avatar, scale: 30),
                        ),
                        title: Text(presidents[index].name,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        subtitle: Text(presidents[index].location,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey)),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.red[400],
                          child: Text(
                            presidents[index].votes.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is ErrorMassage) {
            return ErrorWidget(state.massage.toString());
          }
          return Container();
        },
      ),
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
