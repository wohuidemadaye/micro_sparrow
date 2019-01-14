import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget{

  LoginPage({Key key,this.title}):super(key:key);

  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();

}

class _MyLoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Scaffold(
          body: new Column(
            children: <Widget>[
              new Divider(),
            ],
          ),
    )
    );
  }

  _header() {
    return new Divider();
  }

  _title() {}

  _subtitle() {}

  _login() {}

  _inputText() {}
}