import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:micro_sparrow/Widget/ColorLoader.dart';

class ReadArticle extends StatefulWidget{
  ReadArticle({Key key, this.url}) : super(key: key);

  final String url;

  @override
  State<StatefulWidget> createState() {
    return new _newPage();
  }


}

class _newPage extends State<ReadArticle>{
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(url: widget.url,
      withLocalStorage: true,
      enableAppScheme: true,
      withZoom: true,
      withJavascript: true,
      allowFileURLs: true,
      appBar:new AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert,color: Colors.black45,), onPressed: () {},
          )
        ],
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black45,), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      initialChild: new Center(child: ColorLoader(radius: 15,dotRadius: 6,),),
      appCacheEnabled: true,);
  }
}