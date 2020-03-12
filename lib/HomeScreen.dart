import 'package:flutter/material.dart';
import 'package:flutter_widget1/CustomContainer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

 Widget textlabel(String txt){
   return Text(
     txt,
     style: TextStyle(
       fontSize: 20.0,
       fontWeight: FontWeight.w200,
       ),
     );
 }


class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("My first App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: new CustomConatiner(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('contacts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyanAccent,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
               color: Colors.cyan
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Text(
                            "Ashwini Vishwas",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Neosoft Pune",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
//
                  Container(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/2.png'),
                      radius: 50,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: textlabel('Stream Demo'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/IncrementData');
              },
            ),
            ListTile(
              title: textlabel('Scroll View'),
              onTap: () {
                Navigator.pushNamed(context, '/CustomScrollViewDemo');
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: textlabel('Calculator'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/Calculator');

              },
            ),
            ListTile(
              title: textlabel('Grid View'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/GridUiCustom');
              },
            ),
            ListTile(
              title: textlabel("List View"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/ProductListView');
              },
            ),
            ListTile(
              title: textlabel("Neo Login"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/NeoLoginView');
              },
            ),
            ListTile(
              title: textlabel("Note List"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/NoteList');
              },
            ),
          ],
        ),
      ),
    );
  }
}
