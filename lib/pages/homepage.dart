import 'package:flutter/material.dart';
import 'package:newsapiapp/pages/Apple_tab.dart';
import 'package:newsapiapp/pages/Drawer_information_page.dart';
import 'package:newsapiapp/pages/ShimmerWidget.dart';
import 'package:newsapiapp/pages/TechCrunch_tab.dart';
import 'package:newsapiapp/pages/Tesla_tab.dart';
import 'package:newsapiapp/pages/detailPage.dart';
import 'package:newsapiapp/services/api_manager.dart';
import 'package:newsapiapp/model/newsInfo.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  String name, email;

  HomePage({this.name, this.email});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  TabController _tabController;
  Future<NewsModel> _newsModel;
  Future<NewsModel> _newsModel2;
  Future<NewsModel> _newsModel3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task App'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Text("TechCrunch"),
            Text("Apple"),
            Text("Tesla")
          ],
          labelPadding: EdgeInsets.all(5.0),
          labelStyle: TextStyle(fontSize: 15.0),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                widget.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              accountEmail: Text(
                widget.email,
                style: TextStyle(fontSize: 15.0, fontStyle: FontStyle.italic),
              ),
              currentAccountPicture: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                  child:  Text(
                    widget.name[0],
                    style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.indigo[700]
                ),
              ),
            ),
            ListTile(
              title: Text("Information"),
              trailing: Icon(Icons.help),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage()));
              },
            )
          ],
        ),
      ),

      body: TabBarView(
          controller: _tabController,
          children: [
            RefreshIndicator(
              child:  TechCrunchTab(_newsModel),
              onRefresh: checkInternet
            ),
            RefreshIndicator(
              child: AppleTab(_newsModel2),
              onRefresh: checkInternet
            ),
            RefreshIndicator(
              child: TeslaTab(_newsModel3),
              onRefresh: checkInternet
            )
          ],
      ),
    );
  }
  


  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

      _newsModel = API_Manager().getNews();
      _newsModel2 = API_Manager().getNews();
      _newsModel3 = API_Manager().getNews();

    super.initState();
  }

  Future<Null> checkInternet() async{
    Future.delayed(Duration(seconds: 1));

    final result1 = await Connectivity().checkConnectivity();
    final result2 = await DataConnectionChecker().hasConnection;

    if(result1 == ConnectivityResult.none || result2 == false){
      Fluttertoast.showToast(
          msg: "No Internet!",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG
      );
    }else{
      Fluttertoast.showToast(
          msg: "Updated!",
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG
      );
    }
  }
}
