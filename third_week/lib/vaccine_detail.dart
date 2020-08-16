import 'package:flutter/material.dart';

const columeList = <int>[50, 100, 150];

class VaccineDetail extends StatefulWidget {
  VaccineDetail({this.name, this.image, this.price, this.by, Key key})
      : super(key: key);
  final String name;
  final String image;
  final String price;
  final String by;
  @override
  _VaccineDetailState createState() => _VaccineDetailState();
}

class _VaccineDetailState extends State<VaccineDetail> {
  int _selected = 0;
  int _amount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
          child: Stack(alignment: Alignment.topCenter, children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[700]),
              height: 220,
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop()),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(widget.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(widget.by,
                  style: TextStyle(color: Colors.grey[300], fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                  'A COVID vaccine manufacturing plant of the institute in London'
                  'Two new SpaceX Starships are being assembled in Boca Chica with SN8',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(widget.price,
                  style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
            ),
            SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: columeList.map<Widget>((e) {
                    final index = columeList.indexOf(e);
                    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: InkWell(
                            onTap: () => setState(() => _selected = index),
                            child: Container(
                              height: 40,
                              width: 80,
                              alignment: Alignment.center,
                              child: Text('$e ml',
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
                  }).toList(),
                )),
            SizedBox(
              height: 80,
              child: Center(
                child: Container(
                  height: 40,
                  width: 120,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[700]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (_amount > 0) setState(() => _amount -= 1);
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 30,
                          height: 30,
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[500]),
                          alignment: Alignment.center,
                          child: Text(
                            '—',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      Text(
                        '$_amount',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      InkWell(
                        onTap: () => setState(() => _amount += 1),
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 30,
                          height: 30,
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[500]),
                          alignment: Alignment.center,
                          child: Text(
                            '+',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shop),
                      SizedBox(width: 10),
                      Text('Add to bucket')
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Positioned(
          top: 40,
          child: Container(
            height: 250,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 50,
                      spreadRadius: 10,
                      color: Colors.white24,
                      offset: Offset(50, 20)),
                  BoxShadow(
                      blurRadius: 50,
                      spreadRadius: 10,
                      color: Colors.white24,
                      offset: Offset(-10, 20)),
                ]),
          ),
        ),
        Positioned(
            top: 40,
            child: SizedBox(
                height: 250,
                child:
                    Hero(tag: widget.image, child: Image.asset(widget.image))))
      ])),
    );
  }
}
