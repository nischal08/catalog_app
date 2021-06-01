import 'package:catalog_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeBtn = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/login.png',
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  labelText: "Username",
                ),
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
              ),
              SizedBox(
                height: 20.0,
              ),

              InkWell(
                onTap: () async {
                  changeBtn = !changeBtn;
                  setState(() {});

                  await Future.delayed(Duration(seconds: 1));
                  Navigator.pushNamed(context, HomePage.routeName);
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: changeBtn ? 50 : 150,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // shape: changeBtn ? BoxShape.circle : BoxShape.rectangle,
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeBtn ? 50 : 8),
                  ),
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
              )
              // ElevatedButton(
              //   style: TextButton.styleFrom(),
              //   onPressed: () {
              //     Navigator.pushNamed(context, HomePage.routeName);
              //   },
              //   child: Text("Login"),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
