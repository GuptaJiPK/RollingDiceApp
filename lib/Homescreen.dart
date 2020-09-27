import 'package:flutter/material.dart';
import 'dart:math';

class Homescreen extends StatefulWidget {
  Homescreen({Key key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int leftDice = 1;
  int rightDice = 1;
  void roll() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Roll The Dice"),
      ),
      // drawer: Drawer(
      //     child: Container(
      //       child: Column(
      //         children: [
      //           DrawerHeader(
      //   child: UserAccountsDrawerHeader(
      //           accountName: Text("User"),
      //           accountEmail: Text("User@xyz.com"),
      //   ),
      // ),
      //         ],
      //       ),
      //     )),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(
            //   child: Text('Drawer Header'),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            // ),
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Image(
                  image: AssetImage("assets/images/user.png"),
                ),
              ),
              accountName: Text("User"),
              accountEmail: Text("user@xyz.com"),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text('Home'),
              trailing: Icon(Icons.edit),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.map),
              ),
              title: Text('Directions'),
              trailing: Icon(Icons.edit),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onDoubleTap: roll,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image(
                        image:
                            AssetImage("assets/images/dice-png-$leftDice.png")),
                  ),
                )),
                Expanded(
                    child: GestureDetector(onDoubleTap: roll,
                                          child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image(
                        image:
                            AssetImage("assets/images/dice-png-$rightDice.png")),
                ),
                    ))
              ],
            ),
            RaisedButton(
              hoverColor: Colors.white,
              onPressed: roll,
              child: Text(
                "Roll",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
