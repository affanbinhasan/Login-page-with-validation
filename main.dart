import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  CheckValidation(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      setState(() {
        //changeButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Form(
          key: _formkey,
          child: Container(
            height: 650,
            width: 650,
            color: Colors.black.withOpacity(0.92),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/images/logo.jpg'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Username";
                      } else if (value.contains('@') == false) {
                        return "please enter a vaid email address";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 40,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: InkWell(
                      onTap: () => CheckValidation(context),
                      child: Text(
                        'Login',
                        textScaleFactor: 1.5,
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          //letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Forgot your Password?',
                  style: TextStyle(
                      decoration: TextDecoration.underline, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
