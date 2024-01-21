import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/constants/colors.dart';
import 'package:test1/controller.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:test1/components/linear_indicator.dart';

// bool checkAcceptCTDI(
//     {required Controller controller,
//     required double d,
//     required List<double> listCTDI}) {
//   return controller.isAccept(value: d, values: listCTDI);
// }

// bool checkMoreThanCTDI(
//     {required Controller controller,
//     required double d,
//     required List<double> listCTDI}) {
//   return controller.isMoreThan(value: d, max: listCTDI[1]);
// }

class ResultView extends StatefulWidget {
  const ResultView(
      {Key? key,
      this.d,
      required this.e,
      required this.valuesDLP,
      this.valuesCTDI})
      : super(key: key);

  final double? d;
  final double e;
  final List<double> valuesDLP;
  final List<double>? valuesCTDI;

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
    bool isAcceptDLP =
        _controller.isAccept(value: widget.e, values: widget.valuesDLP);
    bool isMoreThanDLP =
        _controller.isMoreThan(value: widget.e, max: widget.valuesDLP[1]);

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (widget.d != null)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LinearIndicator(
                          isAccept: _controller.isAccept(
                              value: widget.d!, values: widget.valuesCTDI!),
                          isMoreThan: _controller.isMoreThan(
                              value: widget.d!, max: widget.valuesCTDI![1]),
                        ),
                        _controller.isAccept(
                                value: widget.d!, values: widget.valuesCTDI!)
                            ? const Text("ACCEPTABLE",
                                style: TextStyle(
                                    color: textGreen,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold))
                            : const Text("UNACCEPTABLE",
                                style: TextStyle(
                                    color: textRed,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("CTDIvol ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            Text(
                              widget.d!.toStringAsFixed(1),
                              style: TextStyle(
                                color: _controller.isAccept(
                                        value: widget.d!,
                                        values: widget.valuesCTDI!)
                                    ? textGreen
                                    : textRed,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(" mGy",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          _controller.isMoreThan(
                                  value: widget.d!, max: widget.valuesCTDI![1])
                              ? "This value is ${_controller.calDifference(value: widget.d!, max: widget.valuesCTDI![1]).toStringAsFixed(2)}% \nmore than the DRLs."
                              : "This value is ${_controller.calDifference(value: widget.d!, max: widget.valuesCTDI![1]).toStringAsFixed(2)}% \nless than the DRLs.",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(height: 1),
              const SizedBox(
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LinearIndicator(
                    isAccept: isAcceptDLP,
                    isMoreThan: isMoreThanDLP,
                  ),
                  isAcceptDLP
                      ? const Text("ACCEPTABLE",
                          style: TextStyle(
                              color: textGreen,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))
                      : const Text("UNACCEPTABLE",
                          style: TextStyle(
                              color: textRed,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("DLP ",
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                      Text(
                        widget.e.toStringAsFixed(1),
                        style: TextStyle(
                          color: _controller.isAccept(
                                  value: widget.e, values: widget.valuesDLP)
                              ? textGreen
                              : textRed,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(" mGy",
                          style: TextStyle(color: Colors.black, fontSize: 20))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    isMoreThanDLP
                        ? "This value is ${_controller.calDifference(value: widget.e, max: widget.valuesDLP[1]).toStringAsFixed(2)}% \nmore than the DRLs."
                        : "This value is ${_controller.calDifference(value: widget.e, max: widget.valuesDLP[1]).toStringAsFixed(2)}% \nless than the DRLs.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Button(
                buttonName: "End",
                onTapped: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
