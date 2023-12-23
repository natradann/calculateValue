import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/constants/colors.dart';
import 'package:test1/result_view.dart';

class ChestWholeAbView extends StatefulWidget {
  const ChestWholeAbView({Key? key, required this.d, required this.e})
      : super(key: key);

  final double d;
  final double e;

  @override
  State<ChestWholeAbView> createState() => _ChestWholeAbViewState();
}

List<double> standardDLP({required String valueChestAb}) {
  List<double> values = [];
  if (valueChestAb == "NC") {
    values.add(510);
    values.add(914);
  } else if (valueChestAb == "V") {
    values.add(596);
    values.add(1001);
  } else if (valueChestAb == "SUM") {
    values.add(1408);
    values.add(2383);
  }
  return values;
}

List<double> standardCTDI({required String valueChestAb}) {
  List<double> values = [];
  if (valueChestAb == "NC") {
    values.add(8.4);
    values.add(14.4);
  } else if (valueChestAb == "V") {
    values.add(8.3);
    values.add(14.4);
  }
  return values;
}

class _ChestWholeAbViewState extends State<ChestWholeAbView> {
  String valueChest = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Select Phase",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Button(
                      buttonName: "NC",
                      onTapped: () {
                        List<double> valuesDLP =
                            standardDLP(valueChestAb: "NC");
                        List<double> valuesCTDI =
                            standardCTDI(valueChestAb: "NC");

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultView(
                              d: widget.d,
                              e: widget.e,
                              valuesDLP: valuesDLP,
                              valuesCTDI: valuesCTDI,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(
                      buttonName: "V",
                      onTapped: () {
                        List<double> valuesDLP = standardDLP(valueChestAb: "V");
                        List<double> valuesCTDI =
                            standardCTDI(valueChestAb: "V");

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultView(
                              d: widget.d,
                              e: widget.e,
                              valuesDLP: valuesDLP,
                              valuesCTDI: valuesCTDI,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(
                      buttonName: "SUM",
                      onTapped: () {
                        List<double> valuesDLP =
                            standardDLP(valueChestAb: "SUM");

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultView(
                              e: widget.e * 2,
                              valuesDLP: valuesDLP,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
