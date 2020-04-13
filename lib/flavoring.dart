import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'order_summary.dart';

class FlavoringPage extends StatefulWidget {
  FlavoringPage({Key key}) : super(key: key);
  @override
  _FlavoringPageState createState() => _FlavoringPageState();
}

class _FlavoringPageState extends State<FlavoringPage> {

  Widget _longWhiteBar() {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Container(
        height: 6,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(6.0),
            topRight: Radius.circular(6.0),
            bottomLeft: Radius.circular(6.0),
            bottomRight: Radius.circular(6.0),
          ),
        ),
      ),
    );
  }

  void _handleSizeValueChange(int value) {
    setState(() {
      globals.sizeChosen = value;
      globals.calculate_total_price();
    });
  }

  // create the "Size price" row
  List<Widget> _createSizePriceRow() {
    List<Widget> entries = List<Widget>();
    int i = 0;
    for (var item in globals.size_prices.entries) {
      entries.add(
        new Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              new Radio(
                value: i,
                groupValue: globals.sizeChosen,
                onChanged: _handleSizeValueChange,
              ),
              new Text(
                item.key,
                style: TextStyle(fontFamily: 'NuevaStd-Cond', fontSize: 20.0),
              ),
            ],
          ),
        ),
      );
      i++;
    }
    return entries;
  }

  // create the main board container containing the information about
  // 1) coffee  2) size 3) toppings
  Container _createMainBoardContainer() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 470,
        decoration: new BoxDecoration(
          color: Colors.grey,
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('images/coffee_mug.png', width: 100),
            Text(
              globals.coffee_prices.keys.toList()[globals.chosen],
              style: TextStyle(fontFamily: 'NuevaStd-Cond', fontSize: 30.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _createSizePriceRow(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Milk",
                        style: TextStyle(
                            fontFamily: 'NuevaStd-Cond', fontSize: 20.0),
                      ),
                      Checkbox(
                        value: globals.milkAdded,
                        onChanged: (bool value) {
                          setState(() {
                            globals.milkAdded = value;
                            globals.calculate_total_price();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Cream",
                        style: TextStyle(
                            fontFamily: 'NuevaStd-Cond', fontSize: 20.0),
                      ),
                      Checkbox(
                        value: globals.creamAdded,
                        onChanged: (bool value) {
                          setState(() {
                            globals.creamAdded = value;
                            globals.calculate_total_price();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Syrup",
                        style: TextStyle(
                            fontFamily: 'NuevaStd-Cond', fontSize: 20.0),
                      ),
                      Checkbox(
                        value: globals.syrupAdded,
                        onChanged: (bool value) {
                          setState(() {
                            globals.syrupAdded = value;
                            globals.calculate_total_price();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Chocolate",
                        style: TextStyle(
                            fontFamily: 'NuevaStd-Cond', fontSize: 20.0),
                      ),
                      Checkbox(
                        value: globals.chocolateAdded,
                        onChanged: (bool value) {
                          setState(() {
                            globals.chocolateAdded = value;
                            globals.calculate_total_price();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }

  Container _createNextPageButtonContainer() {
    return Container(
      height: 100,
      child: Material(
        elevation: 4.0,
        shape: CircleBorder(),
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage('images/coffee.jpg'),
          fit: BoxFit.scaleDown,
          width: 100.0,
          height: 100.0,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderSummary()),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flavoring Your Coffee',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/coffee-beans.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Flavoring Your Coffee',
                  style: TextStyle(
                      fontFamily: 'NuevaStd-Cond',
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              _longWhiteBar(),
              _createMainBoardContainer(),
              _longWhiteBar(),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(
                          fontFamily: 'NuevaStd-Cond',
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      globals.calculate_total_price(),
                      style: TextStyle(
                          fontFamily: 'NuevaStd-Cond',
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              _createNextPageButtonContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
