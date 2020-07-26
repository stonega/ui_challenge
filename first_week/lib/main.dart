import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  var systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _action = '';
  String _userName = '';
  String _passWord = '';
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[800],
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox.expand(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.white),
                        ),
                        Spacer(),
                        Text(_action)
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Welcome Back', style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white),
              child: Column(children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 120,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.orange[400].withOpacity(0.2),
                            offset: Offset(15, 15),
                            spreadRadius: 1,
                            blurRadius: 20),
                        BoxShadow(
                            color: Colors.orange[400].withOpacity(0.2),
                            offset: Offset(-15, 15),
                            spreadRadius: 1,
                            blurRadius: 20),
                        BoxShadow(
                            color: Colors.orange[400].withOpacity(0.2),
                            offset: Offset(0, -2),
                            spreadRadius: 1,
                            blurRadius: 20),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: 'Email or Phone number',
                          hintStyle: TextStyle(fontSize: 18),
                          filled: false,
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                        ),
                        cursorRadius: Radius.circular(2),
                        autofocus: false,
                        maxLines: 1,
                        controller: _usernameController,
                        onChanged: (value) {
                          _userName = value;
                        },
                      ),
                      Divider(),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 18),
                          filled: false,
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                        ),
                        cursorRadius: Radius.circular(2),
                        autofocus: false,
                        maxLines: 1,
                        controller: _passwordController,
                        onChanged: (value) {
                          _passWord = value;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Text('Forgot Password?',
                    style: TextStyle(color: Colors.grey[500])),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Material(
                    color: Colors.orange[800],
                    borderRadius: BorderRadius.circular(25),
                    child: InkWell(
                      onTap: () => setState(() => _action = 'Login Taped'),
                      borderRadius: BorderRadius.circular(25),
                      child: SizedBox(
                        height: 50,
                        width: 240,
                        child: Center(
                          child: Text('Login',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Continue with social media',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(25),
                      child: InkWell(
                        onTap: () => setState(() => _action = 'Facebook Taped'),
                        borderRadius: BorderRadius.circular(25),
                        child: SizedBox(
                          height: 50,
                          width: 140,
                          child: Center(
                            child: Text(
                              'Facebook',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                      child: InkWell(
                        onTap: () => setState(() => _action = 'Twitter Taped'),
                        borderRadius: BorderRadius.circular(25),
                        child: SizedBox(
                          height: 50,
                          width: 140,
                          child: Center(
                            child: Text('Github',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
