import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/constants/colors.dart';
import 'package:test1/result_view.dart';

class PediatricView extends StatefulWidget {
  const PediatricView({Key? key, required this.d, required this.e})
      : super(key: key);

  final double d;
  final double e;

  @override
  State<PediatricView> createState() => _PediatricViewState();
}

List<double> standardDLP({required String valuePediatric}) {
  List<double> values = [];
  if (valuePediatric == "0 to <1") {
    values.add(208);
    values.add(385);
  } else if (valuePediatric == "1 to <5") {
    values.add(332);
    values.add(637);
  } else if (valuePediatric == "5 to <10") {
    values.add(513);
    values.add(834);
  } else if (valuePediatric == "10 to <15") {
    values.add(620);
    values.add(933);
  }
  return values;
}

List<double> standardCTDI({required String valuePediatric}) {
  List<double> values = [];
  if (valuePediatric == "0 to <1") {
    values.add(13.6);
    values.add(20.5);
  } else if (valuePediatric == "1 to <5") {
    values.add(18.3);
    values.add(31.8);
  } else if (valuePediatric == "5 to <10") {
    values.add(27.8);
    values.add(42.4);
  } else if (valuePediatric == "10 to <15") {
    values.add(34.2);
    values.add(44.4);
  }
  return values;
}

class _PediatricViewState extends State<PediatricView> {

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
                          "Select Age (yrs)",
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
                          buttonName: "0 to <1",
                          onTapped: () {
                            List<double> valuesDLP =
                            standardDLP(valuePediatric: "0 to <1");
                            List<double> valuesCTDI =
                            standardCTDI(valuePediatric: "0 to <1");

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
                          buttonName: "1 to <5",
                          onTapped: () {
                            List<double> valuesDLP = standardDLP(valuePediatric: "1 to <5");
                            List<double> valuesCTDI =
                            standardCTDI(valuePediatric: "1 to <5");

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
                          buttonName: "5 to <10",
                          onTapped: () {
                            List<double> valuesDLP = standardDLP(valuePediatric: "5 to <10");
                            List<double> valuesCTDI =
                            standardCTDI(valuePediatric: "5 to <10");

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
                          buttonName: "10 to <15",
                          onTapped: () {
                            List<double> valuesDLP = standardDLP(valuePediatric: "10 to <15");
                            List<double> valuesCTDI =
                            standardCTDI(valuePediatric: "10 to <15");

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
