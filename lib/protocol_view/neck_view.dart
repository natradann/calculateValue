import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/constants/colors.dart';
import 'package:test1/result_view.dart';

class NeckView extends StatefulWidget {
  const NeckView({Key? key, required this.d, required this.e})
      : super(key: key);

  final double d;
  final double e;

  @override
  State<NeckView> createState() => _NeckViewState();
}

List<double> standardDLP({required String valueNeck}) {
  List<double> values = [];
  if (valueNeck == "NC") {
    values.add(288);
    values.add(477);
  } else if (valueNeck == "C") {
    values.add(269);
    values.add(504);
  } else if (valueNeck == "SUM") {
    values.add(507);
    values.add(932);
  }
  return values;
}

List<double> standardCTDI({required String valueNeck}) {
  List<double> values = [];
  if (valueNeck == "NC") {
    values.add(9.3);
    values.add(14.7);
  } else if (valueNeck == "C") {
    values.add(8.9);
    values.add(16.1);
  }
  return values;
}

class _NeckViewState extends State<NeckView> {

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
                            standardDLP(valueNeck: "NC");
                            List<double> valuesCTDI =
                            standardCTDI(valueNeck: "NC");

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
                          buttonName: "C",
                          onTapped: () {
                            List<double> valuesDLP = standardDLP(valueNeck: "C");
                            List<double> valuesCTDI =
                            standardCTDI(valueNeck: "C");

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
                            standardDLP(valueNeck: "SUM");

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
