import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  int Index;
  String imageUrl;
  String title;
  String description;

  DetailPage(this.Index,this.imageUrl, this.title, this.description);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Hero(
                      tag: widget.Index,
                      child: Image(
                        image: NetworkImage(widget.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    )
                ),
                Positioned(
                  top: 20,
                  left: 15,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white,),
                    color: Colors.white,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height-210,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                        widget.title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(widget.description),
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
