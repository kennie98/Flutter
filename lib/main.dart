import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'flavoring.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<_MenuWidgetState> _key1 = GlobalKey();
  final GlobalKey<_NextPageState> _key2 = GlobalKey();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Vending Machine',
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
                  'Coffee Vending Machine',
                  style: TextStyle(
                      fontFamily: 'NuevaStd-Cond',
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Menu',
                  style: TextStyle(
                      fontFamily: 'NuevaStd-Cond',
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
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
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: 450,
                  decoration: new BoxDecoration(
                    color: Colors.grey,
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  child: MenuWidget(
                    key: _key1,
                    function: showNextPageButton,
                  ),
                ),
              ),
              NextPage(
                key: _key2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNextPageButton() => _key2.currentState.showNextPageButton();
}

// show coffee menu
class MenuWidget extends StatefulWidget {
  final Function function;

  MenuWidget({Key key, this.function}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  void _handleRadioValueChange(int value) {
    setState(() => globals.chosen = value);
    widget.function();
  }

  // build the coffee menu
  List<Widget> buildCoffeeMenu() {
    List<Widget> entries = List<Widget>();
    int i = 0;
    for (var item in globals.coffee_prices.entries) {
      entries.add(
        new Container(
          padding: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 20),
              new Radio(
                value: i,
                groupValue: globals.chosen,
                onChanged: _handleRadioValueChange,
              ),
              SizedBox(width: 30),
              new Text(
                item.key,
                style: TextStyle(fontFamily: 'NuevaStd-Cond', fontSize: 30.0),
              ),
              Spacer(),
              new Text(
                item.value.toString(),
                style: TextStyle(fontFamily: 'NuevaStd-Cond', fontSize: 30.0),
              ),
              SizedBox(width: 40),
            ],
          ),
        ),
      );
      i++;
    }
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buildCoffeeMenu(),
    );
  }
}

// create the "Next page" button
class NextPage extends StatefulWidget {
  NextPage({Key key}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  bool _isCoffeeSelected = false;
  static String image_disabled = 'images/coffee_disabled.jpg';
  static String image_enabled = 'images/coffee.jpg';
  String image = image_disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        height: 100,
        child: Material(
          elevation: 4.0,
          shape: CircleBorder(),
          clipBehavior: Clip.antiAlias,
          color: Colors.transparent,
          child: Ink.image(
            image: AssetImage(image),
            fit: BoxFit.scaleDown,
            width: 100.0,
            height: 100.0,
              child: InkWell(
              onTap: () {
                if(_isCoffeeSelected) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FlavoringPage()),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void showNextPageButton() {
    _isCoffeeSelected = true;
    setState(() => image = image_enabled);
  }
}
