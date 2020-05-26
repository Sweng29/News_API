import 'package:flutter/material.dart';
import 'package:newsapi/helper/news_manager.dart';

class CustomDrawer extends StatelessWidget {

  NewsManager _newsManager = new NewsManager();

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              _newsManager.fetchTopBusinessNews();
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
    );
  }
}
