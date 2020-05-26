import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String url;
  ArticleView({this.url});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 1,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,),
                        shape: BoxShape.rectangle,
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(1),topLeft: Radius.circular(1),bottomRight: Radius.zero,topRight: Radius.zero)
                    ),
                    child: Text('News',style : TextStyle(color: Colors.white,),),
                    padding: EdgeInsets.all(3),
                    //style: TextStyle(backgroundColor: Colors.blue,color: Colors.white,)
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.elliptical(1, 1)),
                        border: Border.all(color: Colors.blue,),
                        shape: BoxShape.rectangle
                    ),
                    child:Text('API',style: TextStyle(color: Colors.blue,),),
                  ),
                ],
              ),
              padding: EdgeInsets.all(2),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('World'),
              leading: Icon(Icons.language),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Business'),
              leading: Icon(Icons.business),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sports'),
              leading: Icon(Icons.golf_course),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Technology'),
              leading: Icon(Icons.desktop_mac),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Entertainment'),
              leading: Icon(Icons.videocam),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
                title: Text('Feedback'),
                leading: Icon(Icons.feedback),
                onTap: (){
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: Text('About Us'),
                leading: Icon(Icons.info),
                onTap: (){
                  Navigator.pop(context);
                }
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue,),
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(1),topLeft: Radius.circular(1),bottomRight: Radius.zero,topRight: Radius.zero)
              ),
              child: Text('News',style : TextStyle(color: Colors.white,),),
              padding: EdgeInsets.all(3),
              //style: TextStyle(backgroundColor: Colors.blue,color: Colors.white,)
            ),
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(1, 1)),
                  border: Border.all(color: Colors.blue,),
                  shape: BoxShape.rectangle
              ),
              child:Text('API',style: TextStyle(color: Colors.blue,),),
            ),
          ],
        ),
        elevation: 5.0,
        centerTitle: true,
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.save),
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 3),
        child: WebView(
            initialUrl: widget.url,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            }
        ),
      ),
    );
  }
}
