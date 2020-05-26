import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/helper/data.dart';
import 'package:newsapi/helper/news_manager.dart';
import 'package:newsapi/models/articles.dart';
import 'package:newsapi/models/category_model.dart';
import 'package:newsapi/screens/custom_drawer.dart';
import 'package:newsapi/screens/article_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Category> categories = new List<Category>();
  List<Article> articleList = new List();
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getTopBusinessNews();
  }

  getTopBusinessNews() async{
    NewsManager newsManager = new NewsManager();
    await newsManager.fetchTopBusinessNews();
    articleList = newsManager.articleList;
    print("Record fetched");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: CustomDrawer(),
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
          ]
      ),
      body: _isLoading ? Container(child: Center(child: CircularProgressIndicator()),) : SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 6),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.all(5),
                child: ListView.builder(itemBuilder: (context,index){
                  if(_isLoading)
                    {
                      return Text('Loading data');
                    }else{
                    return ArticleTile(imageUrl: articleList[index].urlToImage, title: articleList[index].title, description: articleList[index].description,url: articleList[index].url);
                  }
                },shrinkWrap: true,itemCount: articleList.length,physics: ClampingScrollPhysics()),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl,categoryName;

  CategoryTile({this.imageUrl,this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(right: 10,top: 10),
          child: Stack(
            children: <Widget>[
              ClipRRect(borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(imageUrl: imageUrl,width: 120,height: 60,fit: BoxFit.cover,)
                ,
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(categoryName,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
              )
            ],
          ),
      ),
    );

  }
}

class ArticleTile extends StatelessWidget {

  final String imageUrl,title,description,url;


  ArticleTile({@required this.imageUrl,@required this.title,@required this.description,this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleView(url: url,)
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom:10),
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Image.network(imageUrl),
              borderRadius: BorderRadius.circular(6),
            ),
            SizedBox(height: 5,),
            Text(title,style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87
            ),),
            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}


