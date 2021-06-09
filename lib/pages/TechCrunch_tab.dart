import 'package:flutter/material.dart';
import 'package:newsapiapp/pages/loading_page.dart';
import 'package:newsapiapp/model/newsInfo.dart';
import 'package:newsapiapp/pages/detailPage.dart';


class TechCrunchTab extends StatelessWidget {

  Future<NewsModel> _newsModel;

  TechCrunchTab(this._newsModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: FutureBuilder<NewsModel>(
        future: _newsModel,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(thickness: 2,),
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index){
                  var article = snapshot.data.articles[index];
                  return Container(
                      height: 100,
                      child: InkWell(
                        child: Row(
                          children: [
                            Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)
                              ),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Hero(
                                    tag: index,
                                    child: Image.network(article.urlToImage,fit: BoxFit.cover),
                                  )
                              ),
                            ),
                            SizedBox(width: 15.0,),
                            Flexible(
                                child: Column(
                                  children: [
                                    Text(
                                      article.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                                    Text(
                                      article.description,
                                      maxLines: 3,
                                      style: TextStyle(fontSize: 13.0),
                                      overflow: TextOverflow.ellipsis,)
                                  ],
                                )
                            )
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  index,
                                  article.urlToImage,
                                  article.title,
                                  article.content
                              ))
                          );
                        },
                      )
                  );
                });
          }
          else{
            return ListView.builder(
                itemBuilder: (context, index){
                  return Container(
                    child:loadingWidget(),
                  );
                }
            );
          }
        },
      ),
    );
  }
}
