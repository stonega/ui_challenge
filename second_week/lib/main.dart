import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleStyle = TextStyle(color: Colors.red[400], fontSize: 20);
    var contentStyle = TextStyle(
        color: Colors.red[400], fontSize: 22, fontWeight: FontWeight.bold);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Meets', style: titleStyle),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
          actions: [IconButton(icon: Icon(Icons.search), onPressed: null)],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.redAccent[100], width: 2),
                      ),
                      child: Icon(
                        Icons.music_note,
                        color: Colors.redAccent[100],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.redAccent[100], width: 2),
                      ),
                      child: Icon(
                        Icons.trending_up,
                        color: Colors.redAccent[100],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.redAccent[100], width: 2),
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.redAccent[100],
                      ),
                    ),
                  ],
                ),
              ),
              TweenAnimationBuilder(
                duration: Duration(milliseconds: 300),
                tween: Tween<double>(begin: 1.0, end: 0.0),
                builder: (context, value, child) => Transform.translate(
                  offset: Offset(0, 100 * value),
                  child: SizedBox(
                    height: 150,
                    width: width,
                    child: CustomPaint(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Today 6:00 PM', style: titleStyle),
                          Text('Yoga and Meditation for Beginners',
                              style: contentStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 100,
                                child: CustomPaint(
                                  painter: AvatarPainter(count: 5),
                                ),
                              ),
                              Text('Marie and 4 ohters',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 15,
                                  ))
                            ],
                          )
                        ],
                      ),
                      painter: WaveContainer(
                          radius: 40 * (1 - value), color: Colors.pink[100]),
                    ),
                  ),
                ),
              ),
              TweenAnimationBuilder(
                duration: Duration(milliseconds: 400),
                tween: Tween<double>(begin: 1.0, end: 0.0),
                builder: (context, value, child) => Transform.translate(
                  offset: Offset(0, 120 * value),
                  child: SizedBox(
                    height: 200,
                    width: width,
                    child: CustomPaint(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Today 8:00 PM',
                            style: titleStyle,
                          ),
                          Text('Practice French, English and Chinese',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.red[700], width: 2),
                                ),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.red[700],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.red[700], width: 2),
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red[700],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      painter: WaveContainer(
                          radius: 40 * (1 - value), color: Colors.pink[200]),
                    ),
                  ),
                ),
              ),
              TweenAnimationBuilder(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: 1.0, end: 0.0),
                builder: (context, value, child) => Transform.translate(
                  offset: Offset(0, 150 * value),
                  child: SizedBox(
                    height: 250,
                    width: width,
                    child: CustomPaint(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Today 9:00 PM',
                            style: TextStyle(
                                color: Colors.pinkAccent[400],
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Easy and Gentle Yoga',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      painter: WaveContainer(
                          radius: 40 * (1 - value), color: Colors.pink[300]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

const kHalfPi = math.pi / 2;

class WaveContainer extends CustomPainter {
  final double radius;
  final Color color;
  WaveContainer({this.radius, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;
    var path = Path();
    path.moveTo(0, -radius);
    path.arcTo(Rect.fromCircle(center: Offset(radius, -radius), radius: radius),
        kHalfPi * 2, -kHalfPi, true);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(radius, size.height);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(radius, size.height - radius), radius: radius),
        kHalfPi,
        kHalfPi,
        true);
    path.lineTo(0, -radius);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WaveContainer oldDelegate) {
    return oldDelegate.radius != radius;
  }
}

class AvatarPainter extends CustomPainter {
  final int count;
  AvatarPainter({this.count});

  var colorList = <Color>[
    Colors.blueAccent[200],
    Colors.yellow[700],
    Colors.cyan[700],
    Colors.purple[700]
  ];

  var nameList = <String>['T', 'S', 'A', 'C', 'D', 'O', 'P'];
  @override
  void paint(Canvas canvas, Size size) {
    var r = size.height / 2;
    var paint = Paint()
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;
    _drawCircle(int i) {
      paint.color = colorList[i % 4];
      canvas.drawCircle(Offset(r * (i + 1), r), r, paint);
      var span = TextSpan(text: nameList[i], style: TextStyle(fontSize: r));
      var tp = TextPainter(
          text: span,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr);
      tp.layout(
        minWidth: 0,
        maxWidth: r * 2,
      );
      tp.paint(canvas, Offset(r * (i + 1) - r / 4, r / 2));
    }

    for (int i = 0; i < count; i++) {
      _drawCircle(i);
    }
  }

  @override
  bool shouldRepaint(AvatarPainter oldDelegate) {
    return false;
  }
}
