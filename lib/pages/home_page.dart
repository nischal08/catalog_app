import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static  const routeName='/';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text("Catalog app"),),
        body: Center(
          child: Container(
            child: Text('Welcome to the catalog app'),
          ),
        ),
      ),
    );
  }
}
