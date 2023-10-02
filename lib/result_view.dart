import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/controller.dart';
import 'package:test1/enter_values_view.dart';

class ResultView extends StatefulWidget {
  const ResultView(
      {Key? key,
      required this.d,
      required this.e,
      required this.valuesDLP,
      required this.valuesCTDI})
      : super(key: key);

  final double d;
  final double e;
  final List<double> valuesDLP;
  final List<double> valuesCTDI;

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  final Controller _controller = Controller();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isAcceptCTDI =
        _controller.isAccept(value: widget.d, values: widget.valuesCTDI);
    bool isAcceptDLP =
        _controller.isAccept(value: widget.e, values: widget.valuesDLP);
    bool isMoreThanCTDI =
        _controller.isMoreThan(value: widget.d, max: widget.valuesCTDI[1]);
    bool isMoreThanDLP =
        _controller.isMoreThan(value: widget.e, max: widget.valuesDLP[1]);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isAcceptCTDI
                  ? Text("ACCEPTABLE",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.w500))
                  : Text("UNACCEPTABLE",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.w500)),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("CTDIvol ",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  Text(widget.d.toStringAsFixed(1),
                      style: TextStyle(
                          color: isAcceptCTDI ? Colors.green : Colors.red,
                          fontSize: 20)),
                  Text(" mGy",
                      style: TextStyle(color: Colors.black, fontSize: 20))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  isMoreThanCTDI
                      ? "This value is ${_controller.calDifference(value: widget.d, max: widget.valuesCTDI[1]).toStringAsFixed(2)}% more than the DRLs."
                      : "This value is ${_controller.calDifference(value: widget.d, max: widget.valuesCTDI[1]).toStringAsFixed(2)}% less than the DRLs.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
              SizedBox(
                height: 100,
              ),
              isAcceptDLP
                  ? Text("ACCEPTABLE",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.w500))
                  : Text("UNACCEPTABLE",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.w500)),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("DLP ",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  Text(widget.e.toStringAsFixed(1),
                      style: TextStyle(
                          color: isAcceptDLP ? Colors.green : Colors.red,
                          fontSize: 20)),
                  Text(" mGy",
                      style: TextStyle(color: Colors.black, fontSize: 20))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  isMoreThanDLP
                      ? "This value is ${_controller.calDifference(value: widget.e, max: widget.valuesDLP[1]).toStringAsFixed(2)}% more than the DRLs."
                      : "This value is ${_controller.calDifference(value: widget.e, max: widget.valuesDLP[1]).toStringAsFixed(2)}% less than the DRLs.",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              SizedBox(
                height: 100,
              ),
              Button(
                  buttonName: "End",
                  onTapped: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  })
            ],
          ),
        ],
      ),
    ));
  }
}
