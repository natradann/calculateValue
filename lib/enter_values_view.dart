import 'package:flutter/material.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/constants/colors.dart';
import 'package:test1/show_values.dart';

class EnterValuesView extends StatefulWidget {
  const EnterValuesView({Key? key}) : super(key: key);

  @override
  State<EnterValuesView> createState() => _EnterValuesViewState();
}

class _EnterValuesViewState extends State<EnterValuesView> {
  late TextEditingController a;
  late TextEditingController b;
  late TextEditingController c;

  void initState() {
    super.initState();
    a = TextEditingController();
    b = TextEditingController();
    c = TextEditingController();
  }

  //calculate CTDIvol
  double ctdivol({required double a, required double b}) {
    return b / a;
  }

  double dlp({required double a, required double b, required double c}) {
    return b / a * c;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Pitch",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 100,
                height: 50,
                child: TextFormField(
                  controller: a,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "CTDIw",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 100,
                height: 50,
                child: TextFormField(
                  controller: b,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "mGy",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Scan Length",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 100,
                height: 50,
                child: TextFormField(
                  controller: c,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "cm",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Button(
            buttonName: "CALCULATE",
            sizeText: 22,
            weightText: FontWeight.bold,
            bgColor: white,
            fgColor: textColor,
            onTapped: () {
              double d =
                  ctdivol(a: double.parse(a.text), b: double.parse(b.text));
              double e = dlp(
                  a: double.parse(a.text),
                  b: double.parse(b.text),
                  c: double.parse(c.text));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowValuesView(
                    d: d,
                    e: e,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
