import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 90,
            ),
            Text(
              "Votiship",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Center(
            child: Text(
              "This is Details Page",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          )),
    );
  }
}
