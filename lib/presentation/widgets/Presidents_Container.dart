import 'package:flutter/material.dart';
import 'package:votiship/data/models/president.dart';

class PresidentContainer extends StatelessWidget {
  final President president;
  final Function handleTap;
  final Function handleOnLongPressed;
  final Function handleReadMore;

  PresidentContainer(
      {Key key,
      this.president,
      this.handleTap,
      this.handleOnLongPressed,
      this.handleReadMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        color: Color(0xff1E1C1C),
        child: ListTile(
          onLongPress: this.handleOnLongPressed,
          focusColor: Colors.grey[100],
          onTap: this.handleTap,
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(this.president.avatar, scale: 30),
          ),
          title: Text(this.president.name,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.president.location,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey)),
              SizedBox(
                height: 6,
              ),
              GestureDetector(
                onTap: this.handleReadMore,
                child: Text(
                  "Read more >>",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.red[400]),
                ),
              ),
            ],
          ),
          trailing: CircleAvatar(
            backgroundColor: Colors.red[400],
            child: Text(
              this.president.votes.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
