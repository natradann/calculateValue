import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/constants/colors.dart';
import 'package:test1/result_view.dart';

class AbdomenView extends StatefulWidget {
  const AbdomenView({Key? key, required this.d, required this.e})
      : super(key: key);

  final double d;
  final double e;

  @override
  State<AbdomenView> createState() => _AbdomenViewState();
}

List<double> standardDLP({required String valueAbdomen}) {
  List<double> values = [];
  if (valueAbdomen == "upperNC") {
    values.add(265);
    values.add(510);
  } else if (valueAbdomen == "upperV") {
    values.add(283);
    values.add(515);
  } else if (valueAbdomen == "upperSUM") {
    values.add(967);
    values.add(1860);
  } else if (valueAbdomen == "wholeNC") {
    values.add(421);
    values.add(712);
  } else if (valueAbdomen == "wholeV") {
    values.add(470);
    values.add(741);
  } else if (valueAbdomen == "wholeSUM") {
    values.add(1276);
    values.add(2307);
  }
  return values;
}

List<double> standardCTDI({required String valueAbdomen}) {
  List<double> values = [];
  if (valueAbdomen == "upperNC") {
    values.add(8.5);
    values.add(15.2);
  } else if (valueAbdomen == "upperV") {
    values.add(8.7);
    values.add(16.1);
  } else if (valueAbdomen == "wholeNC") {
    values.add(9.1);
    values.add(14.8);
  } else if (valueAbdomen == "wholeV") {
    values.add(9.3);
    values.add(15.7);
  }
  return values;
}

class _AbdomenViewState extends State<AbdomenView> {
  final List<String> abdomenWith = ["", "NC", "V", "SUM"];
  String upperAbValue = "";
  String wholeAbValue = "";
  String valueAb = "";

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
                    Row(
                      children: [
                        const Text(
                          "Upper Abdomen :",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            alignment: Alignment.center,
                            value: upperAbValue,
                            items: abdomenWith.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              setState(
                                () {
                                  upperAbValue = value.toString();
                                  wholeAbValue = "";
                                  valueAb = "upper" + value.toString();
                                },
                              );
                            },
                            focusColor: Colors.grey[300],
                            dropdownColor: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Whole Abdomen :",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            alignment: Alignment.center,
                            value: wholeAbValue,
                            items: abdomenWith.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              setState(
                                () {
                                  wholeAbValue = value.toString();
                                  upperAbValue = "";
                                  valueAb = "whole" + value.toString();
                                },
                              );
                            },
                            focusColor: Colors.grey[300],
                            dropdownColor: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      buttonName: "Continue",
                      bgColor: white,
                      fgColor: textColor,
                      onTapped: () {
                        if (valueAb == "upperSUM" || valueAb == "wholeSUM") {
                          List<double> valuesDLP =
                              standardDLP(valueAbdomen: valueAb);
                          print(widget.e);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultView(
                                e: widget.e * 2,
                                valuesDLP: valuesDLP,
                              ),
                            ),
                          );
                        } else if (valueAb == "upperNC" ||
                            valueAb == "wholeNC" ||
                            valueAb == "upperV" ||
                            valueAb == "wholeV") {
                          List<double> valuesDLP =
                              standardDLP(valueAbdomen: valueAb);
                          List<double> valuesCTDI =
                              standardCTDI(valueAbdomen: valueAb);

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
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text("Please Select Phase"),
                                  duration: Duration(seconds: 1)))
                              .closed
                              .then((_) {});
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
