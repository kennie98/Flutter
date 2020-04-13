import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class OrderSummary extends StatelessWidget {
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

  Widget _longBlackBar() {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
        height: 2,
        decoration: new BoxDecoration(
          color: Colors.black87,
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

  String _calculate_coffee_price() {
    String coffee = globals.coffee_prices.keys.toList()[globals.chosen];
    double price = globals.coffee_prices[coffee];
    String size = globals.size_prices.keys.toList()[globals.sizeChosen];
    double size_price = globals.size_prices[size];
    return (price + size_price).toStringAsFixed(2);
  }

  List<Widget> _get_toppings() {
    List<Widget> entries = new List<Widget>();
    entries.add(
      Row(
        children: <Widget>[
          Text(
            "Toppings:",
            style: TextStyle(fontFamily: 'NuevaStd-Cond', fontSize: 30.0),
          ),
        ],
      ),
    );
    if (globals.milkAdded) {
      entries.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 20),
            Text(
              "Milk",
              style: TextStyle(
                fontFamily: 'NuevaStd-Cond',
                fontSize: 30.0,
              ),
            ),
            Text(
              globals.toppings_prices["Milk"].toStringAsFixed(2),
              style: TextStyle(
                fontFamily: 'NuevaStd-Cond',
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      );
    }
    if (globals.creamAdded) {
      entries.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 20),
            Text(
              "Cream",
              style: TextStyle(
                fontFamily: 'NuevaStd-Cond',
                fontSize: 30.0,
              ),
            ),
            Text(
              globals.toppings_prices["Cream"].toStringAsFixed(2),
              style: TextStyle(
                fontFamily: 'NuevaStd-Cond',
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      );
    }
    if (globals.syrupAdded) {
      entries.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 20),
            Text(
              "Syrup",
              style: TextStyle(
                fontFamily: 'NuevaStd-Cond',
                fontSize: 30.0,
              ),
            ),
            Text(
              globals.toppings_prices["Syrup"].toStringAsFixed(2),
              style: TextStyle(
                fontFamily: 'NuevaStd-Cond',
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      );
    }
    if (globals.chocolateAdded) {
      entries.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 20),
            Text(
              "Chocolate",
              style: TextStyle(
                fontFamily: 'NuevaStd-Cond',
                fontSize: 30.0,
              ),
            ),
            Text(
              globals.toppings_prices["Chocolate"].toStringAsFixed(2),
              style: TextStyle(
                fontFamily: 'NuevaStd-Cond',
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      );
    }
    if (!(globals.chocolateAdded ||
        globals.milkAdded ||
        globals.syrupAdded ||
        globals.creamAdded)) {
      entries.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 20),
            Text(
              "-",
              style: TextStyle(
                fontFamily: 'NuevaStd-Cond',
                fontSize: 30.0,
              ),
            ),
            Text(
              "0.00",
              style: TextStyle(
                fontFamily: 'NuevaStd-Cond',
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      );
    }
    return entries;
  }

  Container _createOrderSummary() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Container(
        height: 590,
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
            Image.asset('images/coffee_with_lid.png', width: 180),
            Text(
              globals.coffee_prices.keys.toList()[globals.chosen],
              style: TextStyle(fontFamily: 'NuevaStd-Cond', fontSize: 30.0),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Size:",
                    style:
                        TextStyle(fontFamily: 'NuevaStd-Cond', fontSize: 30.0),
                  ),
                  Text(
                    globals.size_prices.keys.toList()[globals.sizeChosen],
                    style:
                        TextStyle(fontFamily: 'NuevaStd-Cond', fontSize: 30.0),
                  ),
                  Text(
                    _calculate_coffee_price(),
                    style:
                        TextStyle(fontFamily: 'NuevaStd-Cond', fontSize: 30.0),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: _get_toppings(),
              ),
            ),
            _longBlackBar(),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(
                        fontFamily: 'NuevaStd-Cond',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    globals.calculate_total_price(),
                    style: TextStyle(
                        fontFamily: 'NuevaStd-Cond',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Summary',
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
                  'Order Summary',
                  style: TextStyle(
                      fontFamily: 'NuevaStd-Cond',
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              _longWhiteBar(),
              _createOrderSummary(),
              _longWhiteBar(),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Thank You!',
                  style: TextStyle(
                      fontFamily: 'NuevaStd-Cond',
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
