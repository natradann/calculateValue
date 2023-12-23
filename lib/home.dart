import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/components/Button.dart';
import 'package:test1/constants/colors.dart';
import 'package:test1/enter_values_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: firstBgColor,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            'CTdose',
                            style: GoogleFonts.josefinSans(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                            ),
                          ),
                          Text(
                            'calculator',
                            style: GoogleFonts.josefinSans(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 55,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Transform.rotate(
                        angle: 30 * math.pi / 180,
                        child: Text(
                          "(",
                          style: GoogleFonts.josefinSans(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 55,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Button(
                  buttonName: "Start",
                  weightText: FontWeight.bold,
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EnterValuesView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
