import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/select_protocol.dart';

class ShowValuesView extends StatefulWidget {
  const ShowValuesView({Key? key, required this.d, required this.e})
      : super(key: key);

  final double d;
  final double e;

  @override
  State<ShowValuesView> createState() => _ShowValuesViewState();
}

class _ShowValuesViewState extends State<ShowValuesView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "CTDIvol ${widget.d.toStringAsFixed(1)} mGy",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "DLP ${widget.e.toStringAsFixed(1)} mGy.cm",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              Button(
                  buttonName: "Compare to the DRLs",
                  onTapped: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SelectProtocolView(d: widget.d, e: widget.e)));
                  })
            ],
          ),
        ],
      ),
    ));
  }
}
