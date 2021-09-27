import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:votiship/buisness%20Logic/bloc/bloc/president_bloc.dart';
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
    print(bloc);
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state is VotedState ? 'voted!' : null),
              duration: Duration(seconds: 3),
            ),
          );
        },
        builder: (context, state) {
          if (state is Loading) {
            return CircularProgressIndicator();
          } else if (state is PresidentsList) {
            var presidents = state.presidents;
            return ListView.separated(
              itemCount: presidents.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Color(0xff1E1C1C),
                  child: ListTile(
                    onTap: () {
                      bloc.add(VotePresident(
                          id: presidents[index].id,
                          votes: presidents[index].votes + 1));
                    },
                    leading: CircleAvatar(
                      child: Image.network(
                        presidents[index].avatar,
                      ),
                    ),
                    title: Text(presidents[index].name,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    subtitle: Text(presidents[index].location,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                    trailing: Container(
                        margin: EdgeInsets.all(100.0),
                        child: Center(
                            child: Text(
                          presidents[index].votes.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )),
                        decoration: BoxDecoration(
                            color: Color(0xffE52B50), shape: BoxShape.circle)),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () {
          Navigator.pushNamed(context, detailsScreenRoute);
        },
      ),
    );
  }
}
