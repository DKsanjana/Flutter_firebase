import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

final FirebaseDatabase database = FirebaseDatabase.instance;

void main(){
  runApp(new MaterialApp(
    title: "fire",
    home: new Home(),
  ));

}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();


}


class _HomeState extends State<Home> {
  int _count=0;
  void _itterate(){
     database.reference().child(
       //waht is going to add
       "Message" //column name
     ).set({
       "firstname" : "kaveen"
     });
     setState(() {
       //Reading data
       database.reference().child("message").once().then((DataSnapshot snapshot){
           Map<dynamic,dynamic> list=snapshot.value;
           print("values:${list.values}");
       });


       _count=_count + 1;
     });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text("Fire"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),


        body:
        new Container(
            alignment: Alignment.bottomCenter,
            child:new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("count is $_count"),
                new FlatButton(
                    onPressed: _itterate,
                    child: new Text("add")
                )
              ],
            )


        )


    );
  }
}

