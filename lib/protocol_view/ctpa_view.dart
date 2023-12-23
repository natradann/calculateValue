import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/constants/colors.dart';
import 'package:test1/result_view.dart';

class CTPAView extends StatefulWidget {
  const CTPAView({Key? key, required this.d, required this.e})
      : super(key: key);

  final double d;
  final double e;

  @override
  State<CTPAView> createState() => _CTPAViewState();
}

List<double> standardDLP({required String valueCTPA}) {
  List<double> values = [];
  if (valueCTPA == "NC") {
    values.add(222);
    values.add(397);
  } else if (valueCTPA == "A") {
    values.add(219);
    values.add(495);
  } else if (valueCTPA == "V") {
    values.add(239);
    values.add(414);
  } else if (valueCTPA == "SUM") {
    values.add(625);
    values.add(1312);
  }
  return values;
}

List<double> standardCTDI({required String valueCTPA}) {
  List<double> values = [];
  if (valueCTPA == "NC") {
    values.add(6.5);
    values.add(10.7);
  } else if (valueCTPA == "A") {
    values.add(6.5);
    values.add(12.7);
  } else if (valueCTPA == "V") {
    values.add(7.1);
    values.add(10.8);
  }
  return values;
}

class _CTPAViewState extends State<CTPAView> {

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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Button(
                          buttonName: "NC",
                          onTapped: () {
                            List<double> valuesDLP =
                            standardDLP(valueCTPA: "NC");
                            List<double> valuesCTDI =
                            standardCTDI(valueCTPA: "NC");

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
                            List<double> valuesDLP = standardDLP(valueCTPA: "V");
                            List<double> valuesCTDI =
                            standardCTDI(valueCTPA: "V");

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
                          buttonName: "A",
                          onTapped: () {
                            List<double> valuesDLP = standardDLP(valueCTPA: "A");
                            List<double> valuesCTDI =
                            standardCTDI(valueCTPA: "A");

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
                            standardDLP(valueCTPA: "SUM");

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultView(
                                  e: widget.e * 3,
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
