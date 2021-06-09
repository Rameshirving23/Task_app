import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "News Api page which provides free API's for developers"
              " (https://newsapi.org/) is used to fetch data ",
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
