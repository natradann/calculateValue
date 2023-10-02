import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/brain_view.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/result_view.dart';

class SelectProtocolView extends StatefulWidget {
  const SelectProtocolView({Key? key, required this.d, required this.e})
      : super(key: key);

  final double d;
  final double e;

  @override
  State<SelectProtocolView> createState() => _SelectProtocolViewState();
}

class _SelectProtocolViewState extends State<SelectProtocolView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select Protocol",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Button(
                buttonName: "Brain",
                onTapped: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BrainView(
                                d: widget.d,
                                e: widget.e,
                              )));
                },
              ),
              SizedBox(
                height: 10,
              ),
              Button(
                buttonName: "Chest",
                onTapped: () {},
              ),
              SizedBox(
                height: 10,
              ),
              Button(
                buttonName: "Abdomen",
                onTapped: () {},
              ),
              SizedBox(
                height: 10,
              ),
              Button(
                buttonName: "Chest and Whole Abdomen",
                onTapped: () {},
              ),
              SizedBox(
                height: 10,
              ),
              Button(
                buttonName: "CTPA",
                onTapped: () {},
              ),
              SizedBox(
                height: 10,
              ),
              Button(
                buttonName: "CTA",
                onTapped: () {},
              ),
              SizedBox(
                height: 10,
              ),
              Button(
                buttonName: "Neck",
                onTapped: () {},
              ),
              SizedBox(
                height: 10,
              ),
              Button(
                buttonName: "Paranasal sinus",
                onTapped: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultView(
                              d: widget.d,
                              e: widget.e,
                              valuesDLP: [322, 548],
                              valuesCTDI: [20.5, 34.3])));
                },
              ),
              SizedBox(
                height: 10,
              ),
              Button(
                buttonName: "Urinary stone NC",
                onTapped: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultView(
                              d: widget.d,
                              e: widget.e,
                              valuesDLP: [360, 625],
                              valuesCTDI: [8.5, 13.6])));
                },
              ),
              SizedBox(
                height: 10,
              ),
              Button(
                buttonName: "Brain NC for Pediatrics",
                onTapped: () {},
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
