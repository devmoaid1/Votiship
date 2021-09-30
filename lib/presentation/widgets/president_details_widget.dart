import 'package:flutter/material.dart';
import 'package:votiship/buisness%20Logic/bloc/bloc/president_bloc.dart';
import 'package:votiship/data/models/president.dart';

import '../../routes_constants.dart';

Widget buildPresidentDetails(
    BuildContext context, President president, PresidentBloc bloc) {
  return Container(
    margin: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
    color: Colors.black,
    child: Column(
      children: [
        Stack(children: [
          Container(
            width: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Image.network(
              president.avatar,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 3, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, homeViewRoute);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ]),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                president.name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                president.description,
                style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "votes:",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    " ${president.votes}",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
