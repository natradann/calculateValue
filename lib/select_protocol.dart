import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/constants/colors.dart';
import 'package:test1/protocol_view/abdomen_view.dart';
import 'package:test1/protocol_view/brain_view.dart';
import 'package:test1/protocol_view/chest_view.dart';
import 'package:test1/protocol_view/chest_whole_ab_view.dart';
import 'package:test1/protocol_view/cta_view.dart';
import 'package:test1/protocol_view/ctpa_view.dart';
import 'package:test1/protocol_view/neck_view.dart';
import 'package:test1/protocol_view/pediatric_view.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical:60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Select Protocol",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Button(
                  width: screenWidth * 0.8,
                  buttonName: "Brain",
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BrainView(
                          d: widget.d,
                          e: widget.e,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                  buttonName: "Chest",
                  width: screenWidth * 0.8,
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChestView(
                          d: widget.d,
                          e: widget.e,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                  buttonName: "Abdomen",
                  width: screenWidth * 0.8,
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AbdomenView(
                          d: widget.d,
                          e: widget.e,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                  buttonName: "Chest and Whole Abdomen",
                  width: screenWidth * 0.8,
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChestWholeAbView(
                          d: widget.d,
                          e: widget.e,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                  buttonName: "CTPA",
                  width: screenWidth * 0.8,
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CTPAView(
                          d: widget.d,
                          e: widget.e,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                  buttonName: "CTA",
                  width: screenWidth * 0.8,
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CTAView(
                          d: widget.d,
                          e: widget.e,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                  buttonName: "Neck",
                  width: screenWidth * 0.8,
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NeckView(
                          d: widget.d,
                          e: widget.e,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                  buttonName: "Paranasal sinus NC",
                  width: screenWidth * 0.8,
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultView(
                          d: widget.d,
                          e: widget.e,
                          valuesDLP: const [322, 548],
                          valuesCTDI: const [20.5, 34.3],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                  buttonName: "Urinary stone NC",
                  width: screenWidth * 0.8,
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultView(
                          d: widget.d,
                          e: widget.e,
                          valuesDLP: const [360, 625],
                          valuesCTDI: const [8.5, 13.6],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Button(
                  buttonName: "Brain NC for Pediatrics",
                  width: screenWidth * 0.8,
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PediatricView(
                          d: widget.d,
                          e: widget.e,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
