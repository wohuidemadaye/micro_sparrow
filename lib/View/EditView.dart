import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:micro_sparrow/View/IEditView.dart';
import 'package:micro_sparrow/model/CreateDoc_entity.dart';
import 'package:micro_sparrow/model/DocDetailSerializer_entity.dart';
import 'package:micro_sparrow/presenter/EditPresenter.dart';

const String _markdownData = """# Markdown Example
Markdown allows you to easily include formatted text, images, and even formatted Dart code in your app.

## Styling
Style text as _italic_, __bold__, or `inline code`.

- Use bulleted lists
- To better clarify
- Your points

## Links
You can use [hyperlinks](hyperlink) in markdown

## Images

You can include images:

![Flutter logo](https://flutter.io/images/flutter-mark-square-100.png#100x100)

## Markdown widget

This is an example of how to create your own Markdown widget:

    new Markdown(data: 'Hello _world_!');

## Code blocks
Formatted Dart code looks really pretty too:

```
void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: new Markdown(data: markdownData)
    )
  ));
}
```

Enjoy!
""";

class EditView extends StatefulWidget{
  EditView({Key key, this.id,this.entity}) : super(key: key);
  final String id;
  final DocdetailserializerEntity entity;


  @override
  State<StatefulWidget> createState() {
    return new _EditPage();
  }

}

class _EditPage extends State<EditView> implements IEditView {

  int content = 0;
  TextEditingController _textEditingController = new TextEditingController();
  TextEditingController _titleEditingController = new TextEditingController();
  FocusNode _focusNode = new FocusNode();
  FocusNode _titlefocusNode = new FocusNode();
  EditPresenter _presenter = new EditPresenter();
  bool isSave = false;
  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _presenter.init(this);
    _initData();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
        child:Scaffold(
          key: _scaffoldkey,
            appBar: new AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              brightness: Brightness.light,
              iconTheme: IconThemeData(color: Colors.black87),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.save), onPressed: (){
                  CreatedocEntity doc = new CreatedocEntity();
                  doc.title = _titleEditingController.text;
                  doc.body = _textEditingController.text.replaceAll("\n", "\\n");
                  doc.public = 0;
                  _presenter.createDoc(widget.id,doc);
                }),
                IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
              ],
            ),
            body: TabBarView(
                children: <Widget>[
                  SingleChildScrollView(
                      child: new Padding(padding: EdgeInsets.all(16),
                          child: new Column(
                            children: <Widget>[
                              new TextField(
                                controller: _titleEditingController,
                                focusNode: _titlefocusNode,
                                cursorColor: Colors.green,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '标题',
                                    hintStyle: TextStyle(fontSize: 18)
                                ),
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
                              ),
                              new Divider(),
                              new TextField(
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  controller: _textEditingController,
                                  focusNode: _focusNode,
                                  autofocus: true,
                                  style: new TextStyle(
                                    fontSize: 16,color: Colors.black,wordSpacing: 5,height: 1.5,),
                                  decoration: new InputDecoration.collapsed(
                                      hintText: ''
                                  ),
                                  cursorColor: Colors.green),
                            ],
                          ))
                  ),
                  Markdown(data: "# " + _titleEditingController.text + "\n" + _textEditingController.text,)
                ]
            )
        )
    );
  }

  @override
  void reslutOfPost(bool param0, String s) {
    _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text("保存数据成功"),backgroundColor: Colors.green,));
  }

  void _initData() {
    if(widget.entity != null){
      _presenter.setEntity(widget.entity);
      _titleEditingController.text = widget.entity.data.title;
      _textEditingController.text = widget.entity.data.body;
    }
  }
}