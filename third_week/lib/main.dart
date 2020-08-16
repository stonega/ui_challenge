import 'package:flutter/material.dart';

import 'vaccine_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

const menu = <String>['Vaccine', 'Senitizer', 'Mask', 'Gloves', 'Masks'];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selected = 0;
  int _menuIndex = 0;
  Widget _vaccineWidget({String name, String price, String by, String image}) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: 350,
          width: 250,
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VaccineDetail(
                                    name: name,
                                    price: price,
                                    by: by,
                                    image: image,
                                  ))),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[700]),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 150),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                            Text(by,
                                style: TextStyle(
                                    color: Colors.grey[300], fontSize: 15)),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(price,
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Spacer(),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.yellow),
                                    child: Icon(Icons.add_shopping_cart),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        Positioned(
          top: 20,
          right: 10,
          child: SizedBox(
            height: 200,
            child: Hero(tag: image, child: Image.asset(image)),
          ),
        ),
      ],
    );
  }

  Widget _maskWidget({String name, String image}) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.grey[700]),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(name,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white)),
              ),
              Expanded(child: Image.asset(image))
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.menu, color: Colors.grey[400]),
                          onPressed: () {}),
                      Text('Home',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white)),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: menu.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Center(
                              child: InkWell(
                                onTap: () => setState(() => _selected = index),
                                child: Container(
                                  height: 40,
                                  width: 80,
                                  alignment: Alignment.center,
                                  child: Text(menu[index],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: index == _selected
                                              ? Colors.black
                                              : Colors.white)),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: index == _selected
                                          ? Colors.white
                                          : Colors.grey[700]),
                                ),
                              ),
                            ));
                      }),
                ),
                SizedBox(
                  height: 350,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      _vaccineWidget(
                          name: 'Pro-Vac Vanco',
                          price: '\$34.50',
                          by: 'boximco',
                          image: 'assets/pro-vac.png'),
                      _vaccineWidget(
                          name: 'Disease',
                          price: '\$21.44',
                          by: 'Stone',
                          image: 'assets/live-b1.png'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sanitization',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white),
                        ),
                        Text('All', style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        _maskWidget(name: 'Mask', image: 'assets/mask.png'),
                        _maskWidget(name: 'Gloves', image: 'assets/gloves.png'),
                        _maskWidget(name: 'Soap', image: 'assets/soap.png'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
            Positioned(
              bottom: 10,
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[500].withOpacity(0.8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _menuIndex == 0
                              ? Colors.yellow
                              : Colors.grey[400].withOpacity(0.7)),
                      alignment: Alignment.center,
                      child: Icon(Icons.home, color: Colors.black),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _menuIndex == 1
                              ? Colors.yellow
                              : Colors.grey[400].withOpacity(0.7)),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _menuIndex == 2
                              ? Colors.yellow
                              : Colors.grey[400].withOpacity(0.7)),
                      alignment: Alignment.center,
                      child: Icon(Icons.search, color: Colors.white),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _menuIndex == 3
                              ? Colors.yellow
                              : Colors.grey[400].withOpacity(0.7)),
                      alignment: Alignment.center,
                      child: Icon(Icons.shopping_cart, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
