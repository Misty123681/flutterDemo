import 'package:flutter_widget1/Database/Note.dart';
import 'package:flutter_widget1/Database/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {

  final String appBartitle;

  Note note;

  NoteDetails(this.appBartitle, this.note);

  @override
  _NoteDetailsState createState() => _NoteDetailsState( this.note);
}

class _NoteDetailsState extends State<NoteDetails> {
  _NoteDetailsState(this.note);

  Note note;

  String selectedPriorities;

  @override
  void initState() {
    super.initState();

     selectedPriorities = getPriorityAsString(note.priority);
     titleController.text = note.title;
     discriptionController.text = note.discription;
  }

  var titleController = TextEditingController();
  var discriptionController = TextEditingController();
  var _priporties = ["High", "Low"];

  DatabaseHelper helper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBartitle),
      ),
      body: getListView(),
    );
  }

  moveToPreviousScreen() {
    Navigator.pop(context);
  }

  Widget getListView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: DropdownButton(
              elevation: 2,
              items: _priporties.map((String currentitem) {
                return DropdownMenuItem<String>(
                  child: Text(currentitem),
                  value: currentitem,
                );
              }).toList(),
              value: selectedPriorities,
              onChanged: (value) {
                setState(() {
                  selectedPriorities = value;
                  updatePriorityAsInt(value);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                debugPrint('Something changed in Description Text Field');
                updateTitle();
              },
              decoration: InputDecoration(
                labelText: 'title',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              controller: titleController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                debugPrint('Something changed in Description Text Field');
                updateDescription();
              },
              decoration: InputDecoration(
                labelText: 'Discription',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              controller: discriptionController,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "Save",
                      textScaleFactor: 1.2,
                    ),
                    color: Theme.of(context).primaryColorDark,
                    onPressed: () {
                      _save();
                    },
                  ),
                ),
                Container(width: 20),
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "Delete",
                      textScaleFactor: 1.2,
                    ),
                    color: Theme.of(context).primaryColorDark,
                    onPressed: () {
                      _delete();
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

//Pop to previous screen
  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Update the title of Note object
  void updateTitle() {
    note.title = titleController.text;
  }

  // Update the description of Note object
  void updateDescription() {
    note.discription = discriptionController.text;
  }

  // Save data to database
  void _save() async {
    moveToLastScreen();

    note.date = '12-12-19';

    int result;
    if (note.id != null) {
      // Case 1: Update operation
      result = await helper.updateNote(note);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertNote(note);
    }

    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }
  }

  void _delete() async {
    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (note.id == null) {
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteNote(note.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Note Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Note');
    }
  }

  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              new FlatButton(
                  child: new Text("Ok"),
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

  // Convert the String priority in the form of integer before saving it to Database
  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priporties[0]; // 'High'
        break;
      case 2:
        priority = _priporties[1]; // 'Low'
        break;
    }
    return priority;
  }
}
