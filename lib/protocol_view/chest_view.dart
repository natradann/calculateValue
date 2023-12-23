import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/constants/colors.dart';
import 'package:test1/result_view.dart';

class ChestView extends StatefulWidget {
  const ChestView({Key? key, required this.d, required this.e})
      : super(key: key);

  final double d;
  final double e;

  @override
  State<ChestView> createState() => _ChestViewState();
}

List<double> standardDLP({required String valueChest}) {
  List<double> values = [];
  if (valueChest == "NC or V") {
    values.add(277);
    values.add(509);
  } else if (valueChest == "NC") {
    values.add(253);
    values.add(581);
  } else if (valueChest == "V") {
    values.add(284);
    values.add(590);
  } else if (valueChest == "SUM") {
    values.add(518);
    values.add(1166);
  }
  return values;
}

List<double> standardCTDI({required String valueChest}) {
  List<double> values = [];
  if (valueChest == "NC or V") {
    values.add(7.6);
    values.add(12.1);
  } else if (valueChest == "NC") {
    values.add(6.9);
    values.add(14.8);
  } else if (valueChest == "V") {
    values.add(7.1);
    values.add(15.0);
  }
  return values;
}

class _ChestViewState extends State<ChestView> {
  final List<String> chestList1 = ["", "NC or V"];
  final List<String> chestList2 = ["", "NC", "V", "SUM"];
  String chestValue1 = "";
  String chestValue2 = "";
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Routine 1 phase :",
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
                                    value: chestValue1,
                                    items: chestList1.map<DropdownMenuItem<String>>(
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
                                          chestValue1 = value.toString();
                                          chestValue2 = "";
                                          valueChest = value.toString();
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
                                  "Routine 2 phases :",
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
                                    value: chestValue2,
                                    items: chestList2.map<DropdownMenuItem<String>>(
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
                                              chestValue1 = "";
                                          chestValue2 = value.toString();
                                          valueChest = value.toString();
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
                      ],
                    ),
                    Button(
                      buttonName: "Continue",
                      bgColor: white,
                      fgColor: textColor,
                      onTapped: () {
                        if (valueChest == "SUM") {
                          List<double> valuesDLP =
                          standardDLP(valueChest: valueChest);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultView(
                                    e: widget.e * 2,
                                    valuesDLP: valuesDLP,
                                  )));
                        } else if (valueChest == "NC or V" ||
                            valueChest == "NC" ||
                            valueChest == "V") {
                          List<double> valuesDLP =
                          standardDLP(valueChest: valueChest);
                          List<double> valuesCTDI =
                          standardCTDI(valueChest: valueChest);

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
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
