import 'package:flutter/material.dart';
import 'package:food_app/widgets/textwidgets.dart';

import '../constants/color_const.dart';

class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(color: ColorConst.primary),
          borderRadius: BorderRadius.circular(10)),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                    }
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                    }
                  },
                  child: const Icon(
                    Icons.remove,
                    color: ColorConst.primary,
                    size: 15,
                  ),
                ),
                Text("$count"),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    color: ColorConst.primary,
                    size: 15,
                  ),
                )
              ],
            )
          : Center(
              child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                  },
                  child: const NormalText(text: 'ADD', size: 12)),
            ),
    );
  }
}
