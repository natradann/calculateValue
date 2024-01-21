import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/constants/colors.dart';
import 'package:test1/result_view.dart';

class BrainView extends StatefulWidget {
  const BrainView({Key? key, required this.d, required this.e})
      : super(key: key);

  final double d;
  final double e;

  @override
  State<BrainView> createState() => _BrainViewState();
}

List<double> standardDLP({required String valueBrain}) {
  List<double> values = [];
  if (valueBrain == "phase1NC") {
    values.add(797);
    values.add(1125);
  } else if (valueBrain == "NC") {
    values.add(806);
    values.add(1154);
  } else if (valueBrain == "V") {
    values.add(800);
    values.add(1166);
  } else if (valueBrain == "SUM") {
    values.add(1586);
    values.add(2332);
  }
  return values;
}

List<double> standardCTDI({required String valueBrain}) {
  List<double> values = [];
  if (valueBrain == "phase1NC") {
    values.add(41.5);
    values.add(52.9);
  } else if (valueBrain == "NC") {
    values.add(41.2);
    values.add(57.0);
  } else if (valueBrain == "V") {
    values.add(41.2);
    values.add(57.2);
  }
  return values;
}

class _BrainViewState extends State<BrainView> {
  final List<String> phaseList1 = ["", "NC"];
  final List<String> phaseList2 = ["", "NC", "V", "SUM"];
  String phaseValue1 = "";
  String phaseValue2 = "";
  String valueBrain = "";

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
                        fontWeight: FontWeight.bold,
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
                                border:
                                    Border.all(color: Colors.black, width: 1),
                              ),
                              child: DropdownButton(
                                isExpanded: true,
                                // padding: const EdgeInsets.symmetric(horizontal: 5),
                                alignment: Alignment.center,
                                value: phaseValue1,
                                items: phaseList1.map<DropdownMenuItem<String>>(
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
                                      phaseValue1 = value.toString();
                                      phaseValue2 = "";
                                      valueBrain = "phase1" + value.toString();
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
                                border:
                                    Border.all(color: Colors.black, width: 1),
                              ),
                              child: DropdownButton(
                                isExpanded: true,
                                // padding: const EdgeInsets.symmetric(horizontal: 5),
                                alignment: Alignment.center,
                                value: phaseValue2,
                                items: phaseList2.map<DropdownMenuItem<String>>(
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
                                      phaseValue2 = value.toString();
                                      phaseValue1 = "";
                                      valueBrain = value.toString();
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
                const SizedBox(height: 170),
                Button(
                  buttonName: "Continue",
                  bgColor: white,
                  fgColor: textColor,
                  onTapped: () {
                    if (valueBrain == "SUM") {
                      List<double> valuesDLP =
                          standardDLP(valueBrain: valueBrain);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultView(
                                    e: widget.e * 2,
                                    valuesDLP: valuesDLP,
                                  )));
                    } else if (valueBrain == "phase1NC" ||
                        valueBrain == "NC" ||
                        valueBrain == "V") {
                      List<double> valuesDLP =
                          standardDLP(valueBrain: valueBrain);
                      List<double> valuesCTDI =
                          standardCTDI(valueBrain: valueBrain);

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
