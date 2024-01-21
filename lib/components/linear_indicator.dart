import 'package:flutter/material.dart';

class LinearIndicator extends StatelessWidget {
  const LinearIndicator({
    required this.isAccept,
    required this.isMoreThan,
    super.key,
  });

  final bool isAccept;
  final bool isMoreThan;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 50;
    double barWidth = (screenWidth - 30);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 18,
            width: barWidth,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(10),
                right: Radius.circular(10),
              ),
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: barWidth / 3 - 1,
                  decoration: BoxDecoration(
                    color: (!isAccept && !isMoreThan)
                        ? Colors.red
                        : Colors.transparent,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(10),
                      right: Radius.circular(0),
                    ),
                  ),
                ),
                Container(
                  width: barWidth / 3 - 1,
                  decoration: BoxDecoration(
                    color: (isAccept) ? Colors.green : Colors.transparent,
                    border: const Border.symmetric(
                      vertical: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
                Container(
                  width: barWidth / 3 - 1,
                  decoration: BoxDecoration(
                    color: (isMoreThan) ? Colors.red : Colors.transparent,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(0),
                      right: Radius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            (isAccept) ? Icons.mood : Icons.mood_bad,
            size: 25,
          ),
        ],
      ),
    );
  }
}
