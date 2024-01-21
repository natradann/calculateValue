import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/constants/colors.dart';
import 'package:test1/result_view.dart';

class CTAView extends StatefulWidget {
  const CTAView({Key? key, required this.d, required this.e}) : super(key: key);

  final double d;
  final double e;

  @override
  State<CTAView> createState() => _CTAViewState();
}

List<double> standardDLP({required String valueCTA}) {
  List<double> values = [];
  if (valueCTA == "carotidA") {
    values.add(416);
    values.add(1095);
  } else if (valueCTA == "wholeNC") {
    values.add(821);
    values.add(826);
  } else if (valueCTA == "wholeA") {
    values.add(416);
    values.add(860);
  } else if (valueCTA == "wholeV") {
    values.add(491);
    values.add(826);
  } else if (valueCTA == "wholeSUM") {
    values.add(1249);
    values.add(2536);
  } else if (valueCTA == "thoracicNC") {
    values.add(338);
    values.add(493);
  } else if (valueCTA == "thoracicA") {
    values.add(275);
    values.add(490);
  } else if (valueCTA == "thoracicV") {
    values.add(340);
    values.add(510);
  } else if (valueCTA == "thoracicSUM") {
    values.add(830);
    values.add(1524);
  } else if (valueCTA == "abNC") {
    values.add(361);
    values.add(610);
  } else if (valueCTA == "abA") {
    values.add(317);
    values.add(667);
  } else if (valueCTA == "abV") {
    values.add(365);
    values.add(653);
  } else if (valueCTA == "abSUM") {
    values.add(1090);
    values.add(2083);
  } else if (valueCTA == "Prospective") {
    values.add(67);
    values.add(233);
  } else if (valueCTA == "Retrospective") {
    values.add(381);
    values.add(976);
  } else if (valueCTA == "Calcium score") {
    values.add(33.8);
    values.add(85.1);
  }
  return values;
}

List<double> standardCTDI({required String valueCTA}) {
  List<double> values = [];
  if (valueCTA == "carotidA") {
    values.add(10.9);
    values.add(26.2);
  } else if (valueCTA == "wholeNC") {
    values.add(6.5);
    values.add(12.0);
  } else if (valueCTA == "wholeA") {
    values.add(6.1);
    values.add(12.2);
  } else if (valueCTA == "wholeV") {
    values.add(7.6);
    values.add(11.9);
  } else if (valueCTA == "thoracicNC") {
    values.add(8.6);
    values.add(13.1);
  } else if (valueCTA == "thoracicA") {
    values.add(7.1);
    values.add(12.2);
  } else if (valueCTA == "thoracicV") {
    values.add(8.0);
    values.add(12.4);
  } else if (valueCTA == "abNC") {
    values.add(7.3);
    values.add(11.7);
  } else if (valueCTA == "abA") {
    values.add(6.6);
    values.add(13.8);
  } else if (valueCTA == "abV") {
    values.add(7.1);
    values.add(12.8);
  } else if (valueCTA == "Prospective") {
    values.add(4.5);
    values.add(18.7);
  } else if (valueCTA == "Retrospective") {
    values.add(24.3);
    values.add(60.2);
  } else if (valueCTA == "Calcium score") {
    values.add(2.1);
    values.add(6.2);
  }
  return values;
}

class _CTAViewState extends State<CTAView> {
  final List<String> carotidList = ["", "A"];
  final List<String> ctaWith = ["", "NC", "A", "V", "SUM"];
  final List<String> coronaryItem = [
    "",
    "Prospective",
    "Retrospective",
    "Calcium score"
  ];
  String carotidValue = "";
  String wholeValue = "";
  String thoracicValue = "";
  String abValue = "";
  String coronaryValue = "";
  String valueCTA = "";

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
                            fontWeight: FontWeight.bold),
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
                                "Carotid Artery :",
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.start,
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
                                  // padding:
                                  // const EdgeInsets.symmetric(horizontal: 5),
                                  alignment: Alignment.center,
                                  value: carotidValue,
                                  items:
                                      carotidList.map<DropdownMenuItem<String>>(
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
                                        carotidValue = value.toString();
                                        wholeValue = "";
                                        thoracicValue = "";
                                        abValue = "";
                                        coronaryValue = "";
                                        valueCTA = "carotid" + value.toString();
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
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Whole Aorta :",
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
                                  // padding:
                                  //     const EdgeInsets.symmetric(horizontal: 5),
                                  alignment: Alignment.center,
                                  value: wholeValue,
                                  items: ctaWith.map<DropdownMenuItem<String>>(
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
                                        carotidValue = "";
                                        wholeValue = value.toString();
                                        thoracicValue = "";
                                        abValue = "";
                                        coronaryValue = "";
                                        valueCTA = "whole" + value.toString();
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
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Thoracic Aorta :",
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
                                  // padding:
                                  //     const EdgeInsets.symmetric(horizontal: 5),
                                  alignment: Alignment.center,
                                  value: thoracicValue,
                                  items: ctaWith.map<DropdownMenuItem<String>>(
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
                                        carotidValue = "";
                                        wholeValue = "";
                                        thoracicValue = value.toString();
                                        abValue = "";
                                        coronaryValue = "";
                                        valueCTA =
                                            "thoracic" + value.toString();
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
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Abdominal Aorta :",
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
                                  // padding:
                                  //     const EdgeInsets.symmetric(horizontal: 5),
                                  alignment: Alignment.center,
                                  value: abValue,
                                  items: ctaWith.map<DropdownMenuItem<String>>(
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
                                        carotidValue = "";
                                        wholeValue = "";
                                        thoracicValue = "";
                                        abValue = value.toString();
                                        coronaryValue = "";
                                        valueCTA = "ab" + value.toString();
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
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Coronary Artery:",
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(4.0),
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                ),
                                child: DropdownButton(
                                  isExpanded: true,
                                  // padding:
                                  //     const EdgeInsets.symmetric(horizontal: 5),
                                  alignment: Alignment.center,
                                  value: coronaryValue,
                                  items: coronaryItem
                                      .map<DropdownMenuItem<String>>(
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
                                        carotidValue = "";
                                        wholeValue = "";
                                        thoracicValue = "";
                                        abValue = "";
                                        coronaryValue = value.toString();
                                        valueCTA = value.toString();
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
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                    buttonName: "Continue",
                    bgColor: white,
                    fgColor: textColor,
                    onTapped: () {
                      if (valueCTA == "wholeSUM" ||
                          valueCTA == "thoracicSUM" ||
                          valueCTA == "abSUM") {
                        List<double> valuesDLP =
                            standardDLP(valueCTA: valueCTA);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultView(
                              e: widget.e * 3,
                              valuesDLP: valuesDLP,
                            ),
                          ),
                        );
                      } else if (valueCTA == "carotidA" ||
                          valueCTA == "wholeNC" ||
                          valueCTA == "wholeA" ||
                          valueCTA == "wholeV" ||
                          valueCTA == "thoracicNC" ||
                          valueCTA == "thoracicA" ||
                          valueCTA == "thoracicV" ||
                          valueCTA == "abNC" ||
                          valueCTA == "abA" ||
                          valueCTA == "abV" ||
                          valueCTA == "Prospective" ||
                          valueCTA == "Retrospective" ||
                          valueCTA == "Calcium score") {
                        List<double> valuesDLP =
                            standardDLP(valueCTA: valueCTA);
                        List<double> valuesCTDI =
                            standardCTDI(valueCTA: valueCTA);

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
                            .showSnackBar(
                              const SnackBar(
                                content: Text("Please Select Phase"),
                                duration: Duration(seconds: 1),
                              ),
                            )
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
      ),
    );
  }
}
