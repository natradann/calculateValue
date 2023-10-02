import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/result_view.dart';

class BrainView extends StatefulWidget {
  const BrainView({Key? key, required this.d, required this.e})
      : super(key: key);

  final double d;
  final double e;

  @override
  State<BrainView> createState() => _BrainViewState();
}

List<double> standardDLP({required double e, required String valueBrain}) {
  List<double> values = [];
  if (valueBrain == "NC_Button") {
    values.add(797);
    values.add(1125);
  } else if (valueBrain == "NC") {
    values.add(806);
    values.add(1154);
  } else if (valueBrain == "V") {
    values.add(800);
    values.add(1166);
  }
  return values;
}

List<double> standardCTDI({required double d, required String valueBrain}) {
  List<double> values = [];
  if (valueBrain == "NC_Button") {
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
  final List<String> brainWith = ["NC", "V"];
  String dropdownValue = "NC";
  String valueBrain = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      "Select Phase",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(
                        buttonName: "NC",
                        onTapped: () {
                          setState(() {
                            valueBrain = "NC_Button";
                          });
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "NC,C :",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: DropdownButton(
                            alignment: AlignmentDirectional.centerEnd,
                            value: dropdownValue,
                            items: brainWith
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                dropdownValue = value.toString();
                                valueBrain = value.toString();
                              });
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
                    TextButton(
                        onPressed: () {
                          if (valueBrain != "") {
                            List<double> valuesDLP = standardDLP(
                                e: widget.e, valueBrain: valueBrain);
                            List<double> valuesCTDI = standardCTDI(
                                d: widget.d, valueBrain: valueBrain);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultView(
                                        d: widget.d,
                                        e: widget.e,
                                        valuesDLP: valuesDLP,
                                        valuesCTDI: valuesCTDI)));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text("Please Select Phase"),
                                    duration: Duration(seconds: 1)))
                                .closed
                                .then((_) {});
                          }
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        )),
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
