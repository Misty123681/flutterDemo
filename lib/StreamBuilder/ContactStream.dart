import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget1/StreamBuilder/BLoC.dart';

class ContactStream extends StatefulWidget {
  @override
  _ContactStreamState createState() => _ContactStreamState();
}

class _ContactStreamState extends State<ContactStream> {

 final BLocManager manager = BLocManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        actions: <Widget>[
          StreamBuilder<int>(
            stream: manager.countValue,
            builder: (context, snapshot) {
              if (snapshot.hasData){
                return Chip(
                  label: Text("${snapshot.data}"),
                  backgroundColor: Colors.red,
                );
              }
              else{
                return Chip(
                  label: Text("0"),
                  backgroundColor: Colors.red,
                );
              }
              }
          ),
          Padding(
            padding: EdgeInsets.only(right: 8),
          )
        ],
      ),

      body: StreamBuilder<List<String>>(
        stream: manager.contactsListNow ,
        builder: (context ,shapshot){
          if (shapshot.hasData){
            return ListView.builder(
                itemCount:shapshot.data.length,
                itemBuilder: (BuildContext context, int position){

                  return ListTile(
                    title: Text(
                        shapshot.data[position],
                    ),
                  );
                }
                );
          }else if(shapshot.hasError){
            return Text("Issue in data loading....");
          }
          else{
            return Center(
               child: Text("Loading"),
             );
          }
        },

      ),
    );
  }
}


class CustomButton extends StatelessWidget {

  final String label;
  CustomButton(this.label,this.onPressed);
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed:onPressed, child: Text(label, style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    ),
    );
  }
}