import 'package:flutter_widget1/Database/Note.dart';
import 'package:flutter_widget1/Database/NoteDetails.dart';
import 'package:flutter_widget1/Database/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Note List'
        ),
      ),
      body:getListView(),
      floatingActionButton: FloatingActionButton(
        child: new Icon(Icons.add,color:Colors.black,),
        onPressed: (){
          navigateToDetail(Note.defaultName(), 'Add Note');
        },
      ),
    );
  }
  
  ListView getListView(){
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount:count,
        itemBuilder: (BuildContext context ,int position){
          return Card(
            margin: EdgeInsets.only(left: 8,right: 8,top: 8),
            elevation: 2.0,
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                child: new Icon(Icons.arrow_forward_ios),
                backgroundColor:getColor(this.noteList[position].priority) ,
              ),
              title: Text(this.noteList[position].title),
              subtitle: Text(this.noteList[position].title,),
              trailing:GestureDetector(child: new Icon(Icons.delete,color:Colors.black,),onTap: () {
                _delete(context, noteList[position]);
              },),
              onTap: () {
                navigateToDetail(noteList[position], 'Edit Note');
              }
            ),
          );
        },
    );
  }

  Color getColor(int priority){
    return priority == 1? Colors.green : Colors.yellow;
  }
  //Update Listview
  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<Note>> noteListFuture = databaseHelper.fetchNotesList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
  //Delete note
  void _delete(BuildContext context, Note note) async {

    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      print("Note Deleted successfully");
      updateListView();
    }
  }
  //Navigation
  void navigateToDetail(Note note, String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(title, note);
    }));

    if (result == true) {
      updateListView();
    }
  }
}

