import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickBites!',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int distance = 5;
  List<bool> price = new List<bool>.filled(4, false, growable: false);
  bool anyPrice = true;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text('QuickBites!'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/background.jpg',
              fit: BoxFit.cover,
            ),
            _buildCard(),
            Text('Distance: ' + distance.toString()),
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildCard() => SizedBox(
    height: 90,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: Text('1625 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('My City, CA 99984'),
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          // Divider(),
          // ListTile(
          //   title: Text('(408) 555-1212',
          //       style: TextStyle(fontWeight: FontWeight.w500)),
          //   leading: Icon(
          //     Icons.contact_phone,
          //     color: Colors.blue[500],
          //   ),
          // ),
          // ListTile(
          //   title: Text('costa@example.com'),
          //   leading: Icon(
          //     Icons.contact_mail,
          //     color: Colors.blue[500],
          //   ),
          // ),
        ],
      ),
    ),
  );

  Widget _buildForm() => Column(
    children: <Widget>[
      Slider(
        value: distance.toDouble(),
        min: 1.0,
        max: 15.0,
        divisions: 14,
        onChanged: (double newValue) {
          setState(() {
            distance = newValue.round();
          });
        },
        activeColor: Colors.redAccent,
        inactiveColor: Colors.grey,
        label: distance.toString() + ' mile(s)',
      ),
      RaisedButton(
        onPressed: () {},
        child: const Text('Generate a Random Restaurant'),
      ),
    ],
  );
}