import 'package:flutter/material.dart';
import 'package:flutter_widget1/Neostore/Interface.dart';
import 'package:flutter_widget1/Neostore/RegResponse.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class NeostoreView extends StatefulWidget {
  @override
  NeostoreViewState createState() => NeostoreViewState();
}

class NeostoreViewState extends State<NeostoreView> {
  final _formKey = GlobalKey<FormState>();
  String _username;
  String _password;

// For CircularProgressIndicator.
  bool visible = false;

  void userLogin() {
    setState(() {
      visible = true;
    });

    Interface().fetchLoginCredentials(_username, _password).then((result) {
      if (result != null) {
        print(result.data.first_name);
        setState(() {
          visible = false;
        });
        neverSatisfied("you are successfully loged in.");
      } else {
        setState(() {
          visible = false;
        });

        neverSatisfied("Something went wrong!");
      }
    });
  }

  void neverSatisfied(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
        // return object of type Dialog
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Neo login'),
        ),
        //resizeToAvoidBottomPadding: false,
        body: Center(
          child: Card(
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 1.0,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter your first name',
                          ),
                          onChanged: (name) {
                            _username = name;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          }),
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Enter your password name'),
                          onChanged: (name) {
                            _password = name;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter password text';
                            }
                            return null;
                          }),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: OutlineButton(
                            child: Text(
                              "Registration",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                userLogin();
                              }
                            }),
                      ),
                      Visibility(
                        visible: visible,
                        child: Container(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
