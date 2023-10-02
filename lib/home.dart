import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/enter_values_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Button(
        buttonName: "Start",
        onTapped: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EnterValuesView()));
        },
      ),
    ));
  }
}
