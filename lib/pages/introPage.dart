
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapiapp/pages/homepage.dart';
import 'package:permission_handler/permission_handler.dart';


class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {

  String name;
  String email;
  GlobalKey<FormFieldState> Text1, Text2;
  GlobalKey<FormState> _formkey;
  AnimationController _controller;
  Animation delayedAnimation1, delayedAnimation2, delayedAnimation3,delayedAnimation4;

  @override
  void initState() {
    Text1 = GlobalKey<FormFieldState>();
    Text2 = GlobalKey<FormFieldState>();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2500));
    delayedAnimation1 = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve:Interval(0, 1, curve:Curves.fastOutSlowIn)));
    delayedAnimation2 = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.5, 1, curve:Curves.fastOutSlowIn)));
    delayedAnimation3 = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.8, 1, curve:Curves.fastOutSlowIn)));
    delayedAnimation4 = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.8, 1, curve:Curves.fastOutSlowIn)));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child){
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(0.0, delayedAnimation1.value*height, 0.0),
                      child: Text("Welcome", style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(delayedAnimation4.value*height, 0.0, 0.0),
                      child: Text("!", style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Transform(
                      transform: Matrix4.translationValues(delayedAnimation1.value*height, 0.0, 0.0),
                      child: TextFormField(
                        key: Text1,
                        validator: (name) => name.isEmpty ? "Enter valid name" : null,
                        onChanged: (val){
                          setState(() {
                            name = val;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Your Name",
                        ),
                      ),
                    )
                ),
                SizedBox(height: 5.0,),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Transform(
                      transform:  Matrix4.translationValues( delayedAnimation2.value*height,0.0, 0.0),
                      child: TextFormField(
                        key: Text2,
                        validator: (email) => email.isEmpty ? "Enter valid email" : null,
                        onChanged: (val){
                          setState(() {
                            email = val;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Your email (ex: abc@gmail.com)",
                        ),
                      ),
                    )
                ),
                SizedBox(height: 50.0,),
                Transform(
                  transform: Matrix4.translationValues( delayedAnimation3.value*height,0.0, 0.0) ,
                  child: ElevatedButton(
                      onPressed: (){
                        if(Text1.currentState.validate() && Text2.currentState.validate()){
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => HomePage(name: name, email: email,))
                          );
                        }
                      },
                      child: Container(
                        width: 150,
                        height: 60,
                        child: ListTile(
                          title: Text("Continue", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                        ),
                      )
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
