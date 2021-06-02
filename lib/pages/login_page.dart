import 'package:catalog_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeBtn = false;
  String name = '';
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      changeBtn = true;
      setState(() {});

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, HomePage.routeName);

      changeBtn = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/login.png',
                  height: 300,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username cannot be empty';
                    }
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (value.length < 6) {
                      return "Password length should be more than 5 characters.";
                    }
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeBtn ? 50 : 8),
                  child: InkWell(
                    splashColor: Colors.red,
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeBtn ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeBtn
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
